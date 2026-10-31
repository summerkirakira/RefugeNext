import 'package:flutter/widgets.dart';
import '../../../datasource/models/shop/cart_snapshot.dart';
import '../../../datasource/models/shop/store_model.dart' show LineItem;
import '../../../funcs/shop/cart.dart' as actions;
import '../../../network/graphql/shop/cart_snapshot_query.dart';
import '../../../network/api_service.dart';

abstract class CartGateway {
  Future<CartSnapshot> load();
  Future<void> edit();
  Future<void> quantity(LineItem item, int quantity);
  Future<void> remove(LineItem item);
  Future<void> clear();
  Future<void> credit(int cents);

  /// true when the existing native flow completes, false when web checkout is needed.
  Future<bool> checkout();
}

class RsiCartGateway implements CartGateway {
  RsiCartGateway() : _generation = RsiApiClient().session.generation;
  final int _generation;
  void _check() => RsiApiClient().session.assertGeneration(_generation);
  @override
  Future<CartSnapshot> load() async {
    _check();
    final snapshot = await CartSnapshotQuery().execute();
    _check();
    return snapshot;
  }

  @override
  Future<void> edit() async {
    _check();
    await actions.setStep('CartLines');
    _check();
  }

  @override
  Future<void> quantity(LineItem item, int quantity) async {
    _check();
    await actions.updateCartNumber(item, quantity);
    _check();
  }

  @override
  Future<void> remove(LineItem item) async {
    _check();
    await actions.removeCartItem(item);
    _check();
  }

  @override
  Future<void> clear() async {
    _check();
    await actions.clearCart();
    _check();
  }

  @override
  Future<void> credit(int cents) async {
    _check();
    await actions.updateCredit(cents / 100);
    _check();
  }

  @override
  Future<bool> checkout() async {
    await edit();
    await actions.gotoNextStep();
    _check();
    await actions.assignFirstAddress();
    _check();
    final result = await actions.validateCart();
    _check();
    return !result.cart.flow.current.orderCreated;
  }
}

class CartController extends ChangeNotifier {
  CartController(
      {required this.gateway,
      required CartSnapshot initial,
      this.isBuyback = false})
      : snapshot = initial {
    creditInput.text = (initial.creditApplied / 100).toStringAsFixed(2);
    creditInput.addListener(_creditChanged);
  }
  final CartGateway gateway;
  final bool isBuyback;
  CartSnapshot snapshot;
  final creditInput = TextEditingController();
  String? busy, error, errorTarget;
  bool needsRefresh = false;
  bool webReviewRequired = false;
  bool _checkoutFinished = false;
  bool _closed = false;

  bool get creditDirty =>
      parseCreditCents(creditInput.text) != snapshot.creditApplied;
  bool get canEdit =>
      !_closed &&
      !_checkoutFinished &&
      busy == null &&
      !needsRefresh &&
      !webReviewRequired;
  bool get canCheckout => canEdit && snapshot.items.isNotEmpty && !creditDirty;
  String? get creditError {
    if (!creditDirty) return null;
    final cents = parseCreditCents(creditInput.text);
    if (cents == null) return '请输入非负金额，最多两位小数';
    if (cents > snapshot.maxCredit) {
      return '不能超过本单可用 ${cartMoney(snapshot.maxCredit, snapshot.currency)}';
    }
    return null;
  }

  void _notify() {
    if (!_closed) notifyListeners();
  }

  void _creditChanged() {
    _notify();
  }

  void cancelCreditDraft() {
    if (busy != null) return;
    creditInput.text = (snapshot.creditApplied / 100).toStringAsFixed(2);
  }

  void _accept(CartSnapshot value) {
    if (_closed) return;
    final dirty = creditDirty;
    snapshot = value;
    if (!dirty || value.items.isEmpty) {
      creditInput.text = (value.creditApplied / 100).toStringAsFixed(2);
    }
    needsRefresh = false;
  }

  Future<void> refresh() async {
    if (_closed || busy != null) return;
    busy = 'refresh';
    error = null;
    errorTarget = null;
    _notify();
    try {
      final value = await gateway.load();
      _accept(value);
    } catch (e) {
      if (!_closed) {
        needsRefresh = true;
        error = '读取购物车失败：${_message(e)}';
      }
    } finally {
      if (!_closed) {
        busy = null;
        _notify();
      }
    }
  }

  Future<void> _mutate(String target, Future<void> Function() action) async {
    if (!canEdit) return;
    busy = target;
    error = null;
    errorTarget = target;
    needsRefresh = true;
    _notify();
    var changed = false;
    try {
      if (snapshot.step != 'CartLines') await gateway.edit();
      if (_closed) return;
      await action();
      changed = true;
      if (_closed) return;
      _accept(await gateway.load());
    } catch (e) {
      if (!_closed) {
        error =
            changed ? '操作已完成，最新金额读取失败，请刷新确认' : '操作未能确认：${_message(e)}。请先刷新购物车';
      }
    } finally {
      if (!_closed) {
        busy = null;
        _notify();
      }
    }
  }

  Future<void> changeQuantity(LineItem item, int value) async {
    if (!canEdit) return;
    if (value < item.sku.minQty || value > item.sku.maxQty) {
      errorTarget = item.id;
      error = '数量须为 ${item.sku.minQty}～${item.sku.maxQty}';
      _notify();
      return;
    }
    if (value == item.qty) return;
    await _mutate(item.id, () => gateway.quantity(item, value));
  }

  Future<void> remove(LineItem item) =>
      _mutate(item.id, () => gateway.remove(item));
  Future<void> clear() => _mutate('clear', gateway.clear);
  Future<void> applyCredit([int? amount]) async {
    if (!canEdit) return;
    if (amount != null) creditInput.text = (amount / 100).toStringAsFixed(2);
    if (!creditDirty || creditError != null) return;
    final cents = parseCreditCents(creditInput.text)!;
    await _mutate('credit', () => gateway.credit(cents));
  }

  Future<void> checkout(
      {required Future<bool> Function() authenticate,
      required Future<void> Function() openWeb,
      required VoidCallback completed}) async {
    if (_closed || busy != null) return;
    if (webReviewRequired) {
      busy = 'checkout';
      _notify();
      try {
        await openWeb();
      } catch (e) {
        if (!_closed) {
          errorTarget = 'checkout';
          error = '打开官网失败：${_message(e)}';
        }
      } finally {
        if (!_closed) {
          busy = null;
          _notify();
        }
      }
      return;
    }
    if (!canCheckout) return;
    busy = 'checkout';
    error = null;
    errorTarget = 'checkout';
    _notify();
    var submitted = false;
    try {
      final before = snapshot.checkoutFingerprint;
      final latest = await gateway.load();
      if (_closed) return;
      _accept(latest);
      if (before != latest.checkoutFingerprint) {
        error = '购物车已更新，请核对金额后重新确认';
        return;
      }
      if (!await authenticate() || _closed) return;
      if (isBuyback) {
        await openWeb();
        return;
      }
      submitted = true;
      if (await gateway.checkout()) {
        if (!_closed) {
          _checkoutFinished = true;
          completed();
        }
      } else {
        webReviewRequired = true;
        if (!_closed) await openWeb();
      }
    } catch (e) {
      if (!_closed) {
        needsRefresh = true;
        webReviewRequired = submitted;
        error = submitted
            ? '结算结果未能确认：${_message(e)}。请到官网检查后继续'
            : '无法继续购买：${_message(e)}';
      }
    } finally {
      if (!_closed) {
        busy = null;
        _notify();
      }
    }
  }

  String _message(Object error) =>
      error.toString().replaceFirst(RegExp(r'^Exception: '), '');
  @override
  void dispose() {
    _closed = true;
    creditInput.dispose();
    super.dispose();
  }
}
