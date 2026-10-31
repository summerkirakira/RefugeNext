import 'package:flutter/material.dart';
import '../../../network/graphql/shop/catalog_purchase_availability.dart';

/// One add operation, followed by separately retryable cart loading.
class CatalogPurchaseController extends ChangeNotifier {
  CatalogPurchaseController(
      {required this.add, required this.prepareCart, this.loadAvailability});

  final Future<void> Function(int quantity) add;
  final Future<VoidCallback> Function() prepareCart;
  final Future<CatalogPurchaseAvailability> Function()? loadAvailability;
  CatalogPurchaseAvailability? _availability;
  final quantityText = TextEditingController(text: '1');
  bool busy = false;
  bool added = false;
  bool _closed = false;
  String? error;

  bool get ready => loadAvailability == null || _availability != null;
  int get minimumQuantity => _availability?.minimum ?? 1;
  int get maximumQuantity => _availability?.maxAddQuantity ?? 5;
  int get cartQuantity => _availability?.inCart ?? 0;
  bool get cartOnly => _availability?.cartOnly ?? false;
  bool get canSubmit => !busy && (!ready || cartOnly || quantity != null);

  Future<void> _refreshAvailability() async {
    if (loadAvailability == null) return;
    final value = await loadAvailability!();
    if (_closed) return;
    _availability = value;
    if (!cartOnly) {
      quantityText.text = (int.tryParse(quantityText.text) ?? minimumQuantity)
          .clamp(minimumQuantity, maximumQuantity)
          .toString();
    }
  }

  Future<void> initialize() async {
    if (ready || busy || _closed) return;
    busy = true;
    error = null;
    notifyListeners();
    try {
      await _refreshAvailability();
    } catch (e) {
      if (!_closed) error = '无法检查可购数量：$e';
    } finally {
      if (!_closed) {
        busy = false;
        notifyListeners();
      }
    }
  }

  int? get quantity {
    final value = int.tryParse(quantityText.text);
    return value != null && value >= minimumQuantity && value <= maximumQuantity
        ? value
        : null;
  }

  String? get quantityError => !ready || cartOnly || quantity != null
      ? null
      : minimumQuantity == maximumQuantity
          ? '当前可添加 $minimumQuantity 件'
          : '请输入 $minimumQuantity～$maximumQuantity 的整数';

  void changeQuantity(String value) {
    if (busy || added || cartOnly || _closed) return;
    error = null;
    notifyListeners();
  }

  void step(int delta) {
    if (busy || added || cartOnly || !ready || _closed) return;
    quantityText.text = ((quantity ?? minimumQuantity) + delta)
        .clamp(minimumQuantity, maximumQuantity)
        .toString();
    changeQuantity(quantityText.text);
  }

  Future<void> submit(VoidCallback close) async {
    if (!canSubmit || _closed) return;
    if (!ready) {
      await initialize();
      return;
    }
    busy = true;
    error = null;
    notifyListeners();
    try {
      if (!added) {
        final requested = quantity;
        // Another browser or view may have changed the cart since opening.
        await _refreshAvailability();
        if (_closed) return;
        if (!cartOnly) {
          if (requested == null || requested != quantity) {
            error = '可购数量已变化，请确认数量后重试';
            return;
          }
          await add(requested);
          if (_closed) return;
          added = true;
        }
        notifyListeners();
      }
      final open = await prepareCart();
      if (_closed) return;
      busy = false;
      notifyListeners();
      close();
      open();
    } catch (e) {
      if (!_closed) {
        error = added
            ? '商品已加入，购物车加载失败，请重新打开购物车。'
            : cartOnly
                ? '购物车加载失败，请重试。'
                : '加入购物车失败：${e.toString().replaceFirst(RegExp(r"^Exception: "), "")}';
      }
    } finally {
      if (!_closed) {
        busy = false;
        notifyListeners();
      }
    }
  }

  @override
  void dispose() {
    _closed = true;
    quantityText.dispose();
    super.dispose();
  }
}
