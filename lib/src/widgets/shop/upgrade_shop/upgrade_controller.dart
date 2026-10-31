import 'package:flutter/foundation.dart';

import '../../../datasource/models/shop/upgrade_ship_info.dart';
import '../../../funcs/rsi_web_session.dart';
import '../../../network/api_service.dart';
import '../../../network/graphql/shop/apply_upgrade_token.dart';
import '../../../network/graphql/shop/upgrade_add_to_cart.dart';
import '../../../repo/ship_upgrade.dart';
import '../../../repo/translation.dart';
import '../../../services/rsi_session_service.dart';
import '../../../services/rsi_web_session.dart';

class UpgradeOptions {
  const UpgradeOptions(this.from, this.to,
      {this.currency = 'USD', this.taxInclusive = false});
  final List<UpgradeShipInfo> from, to;
  final String currency;
  final bool taxInclusive;
}

abstract class UpgradeGateway {
  Future<UpgradeOptions> initialize();
  Future<UpgradeOptions> filter(int? fromId, int? skuId);
  Future<String> createToken(int fromId, int skuId);
  Future<void> applyToken(String token);
}

class RsiUpgradeGateway implements UpgradeGateway {
  final _repo = ShipUpgradeRepo();
  final _session = RsiApiClient().session;
  int? _generation;
  String _currency = 'USD';
  bool _taxInclusive = false;

  void _check() => _session.assertGeneration(_generation!);

  @override
  Future<UpgradeOptions> initialize() async {
    await rsiWebSession.ensure(RsiWebSessionAttempt());
    _generation = _session.generation;
    final catalog = await _repo.planningCatalog(refresh: true);
    _check();
    final app = catalog.data['app'];
    if (app is! Map || app['isAnonymous'] != false) {
      throw RsiSessionExpired();
    }
    final pricing = app['pricing'];
    if (pricing is! Map ||
        pricing['currencyCode'] is! String ||
        pricing['isTaxInclusive'] is! bool) {
      throw StateError('无法读取升级价格信息');
    }
    _currency = pricing['currencyCode'];
    _taxInclusive = pricing['isTaxInclusive'];
    return filter(null, null);
  }

  @override
  Future<UpgradeOptions> filter(int? fromId, int? skuId) async {
    _check();
    final lists = await _repo.filterShipUpgrade(fromId, skuId);
    _check();
    for (final ship in [...lists[0], ...lists[1]]) {
      ship.chineseName = TranslationRepo().getTranslationSync(ship.name ?? '');
    }
    return UpgradeOptions(lists[0], lists[1],
        currency: _currency, taxInclusive: _taxInclusive);
  }

  @override
  Future<String> createToken(int fromId, int skuId) async {
    _check();
    final token =
        await UpgradeAddToCart(skuId: skuId, fromShipId: fromId).execute();
    _check();
    return token;
  }

  @override
  Future<void> applyToken(String token) async {
    _check();
    await ApplyUpgradeToken(upgradeToken: token).execute();
    _check();
  }
}

/// Selections are committed only after their quote succeeds. No failed request
/// clears the user's previous choices, and no mutation is automatically replayed.
class UpgradeController extends ChangeNotifier {
  UpgradeController(this.gateway);
  final UpgradeGateway gateway;
  UpgradeOptions? options;
  UpgradeShipInfo? from, to;
  Skus? sku;
  bool busy = false, added = false, needsCartReview = false;
  bool submitting = false;
  bool _closed = false, _quoteValid = false;
  String? error, notice;

  bool get hasCurrentQuote => _quoteValid;

  bool get canEdit => !busy && !added && !needsCartReview;
  bool get canAdd =>
      canEdit &&
      _quoteValid &&
      from != null &&
      to != null &&
      sku?.canPurchase == true &&
      (sku?.upgradePrice ?? 0) > 0;

  void _notify() {
    if (!_closed) notifyListeners();
  }

  static T? _find<T>(Iterable<T> values, bool Function(T) predicate) {
    for (final value in values) {
      if (predicate(value)) return value;
    }
    return null;
  }

  Future<void> load() async {
    if (busy || _closed) return;
    busy = true;
    error = null;
    _quoteValid = false;
    _notify();
    try {
      final value = await gateway.initialize();
      if (_closed) return;
      options = value;
      from = null;
      to = null;
      sku = null;
      added = false;
      needsCartReview = false;
      _quoteValid = false;
      notice = null;
    } catch (e) {
      error = _message(e);
    } finally {
      busy = false;
      _notify();
    }
  }

  Future<void> selectFrom(UpgradeShipInfo? value) => _select(value, to, sku);
  Future<void> selectTo(UpgradeShipInfo? value, {bool preferWarbond = false}) {
    final versions = value?.skus ?? <Skus>[];
    final selected =
        _find(versions, (s) => s.canPurchase && s.isWarbond == preferWarbond) ??
            _find(versions, (s) => s.canPurchase);
    return _select(from, value, selected);
  }

  Future<void> selectSku(Skus value) => _select(from, to, value);
  Future<void> refreshQuote() => _select(from, to, sku);

  Future<void> _select(
      UpgradeShipInfo? nextFrom, UpgradeShipInfo? nextTo, Skus? nextSku) async {
    if (!canEdit || _closed) return;
    busy = true;
    error = null;
    notice = null;
    _quoteValid = false;
    _notify();
    try {
      final value = await gateway.filter(nextFrom?.id, nextSku?.id);
      if (_closed) return;
      final target = _find(value.to, (s) => s.id == nextTo?.id);
      final version =
          _find(target?.skus ?? <Skus>[], (s) => s.id == nextSku?.id);
      if (nextFrom != null &&
          nextSku != null &&
          !value.from.any((s) => s.id == nextFrom.id)) {
        throw StateError('该起始舰船不能购买此版本，请更换起点或版本');
      }
      if (nextTo != null &&
          (target == null || version == null || !version.canPurchase)) {
        throw StateError('所选升级版本暂不可用，请更换目标或版本');
      }
      options = value;
      from = nextFrom;
      to = target;
      sku = version;
      _quoteValid = true;
      if (from != null && sku != null && (sku!.upgradePrice ?? 0) <= 0) {
        notice = '暂未取得有效升级差价，请刷新报价';
      }
    } catch (e) {
      error = _message(e);
    } finally {
      busy = false;
      _notify();
    }
  }

  Future<bool> add() async {
    if (!canAdd || _closed) return false;
    submitting = true;
    busy = true;
    error = null;
    notice = null;
    _notify();
    var applying = false;
    try {
      final previous = sku!;
      final previousCurrency = options!.currency;
      final previousTax = options!.taxInclusive;
      final value = await gateway.filter(from!.id, previous.id);
      if (_closed) return false;
      final target = _find(value.to, (s) => s.id == to!.id);
      final fresh = _find(target?.skus ?? <Skus>[], (s) => s.id == previous.id);
      if (!value.from.any((s) => s.id == from!.id) ||
          fresh == null ||
          !fresh.canPurchase ||
          (fresh.upgradePrice ?? 0) <= 0) {
        _quoteValid = false;
        throw StateError('该升级组合已不可购买，请刷新报价或更换舰船');
      }
      options = value;
      to = target;
      sku = fresh;
      if (fresh.upgradePrice != previous.upgradePrice ||
          value.currency != previousCurrency ||
          value.taxInclusive != previousTax) {
        notice = '升级报价已更新，请确认新价格后再加入购物车';
        return false;
      }
      final token = await gateway.createToken(from!.id!, fresh.id!);
      if (_closed) return false;
      applying = true;
      await gateway.applyToken(token);
      added = true;
      return true;
    } catch (e) {
      needsCartReview = applying;
      error = applying ? '未能确认添加结果，请先检查购物车，避免重复添加。${_message(e)}' : _message(e);
      return false;
    } finally {
      submitting = false;
      busy = false;
      _notify();
    }
  }

  static String _message(Object error) {
    if (error is RsiSessionChanged) return '账号已切换，请重新打开舰船升级';
    if (error is RsiSessionExpired) return '登录已失效，请重新登录后打开舰船升级';
    if (error is StateError) return error.message.toString();
    return '请求未完成，请检查网络后重试';
  }

  @override
  void dispose() {
    _closed = true;
    super.dispose();
  }
}
