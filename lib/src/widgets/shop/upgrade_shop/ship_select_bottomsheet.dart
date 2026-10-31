import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../datasource/models/shop/cart_snapshot.dart' show cartMoney;
import '../../../datasource/models/shop/upgrade_ship_info.dart';

String upgradeShipName(UpgradeShipInfo ship) =>
    ship.chineseName.isNotEmpty ? ship.chineseName : (ship.name ?? '未知舰船');

class ShipPickerState {
  String query = '';
  bool restricted = false, ascending = true;
  double offset = 0;
}

Future<UpgradeShipInfo?> selectUpgradeShip(BuildContext context,
        {required List<UpgradeShipInfo> ships,
        required bool source,
        required String currency,
        required ShipPickerState state,
        int? selectedId}) =>
    showModalBottomSheet<UpgradeShipInfo>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      constraints: const BoxConstraints(maxWidth: 720),
      builder: (_) => SizedBox(
        height: MediaQuery.sizeOf(context).height * .85,
        child: UpgradeShipPicker(
            ships: ships,
            source: source,
            currency: currency,
            state: state,
            selectedId: selectedId),
      ),
    );

class UpgradeShipPicker extends StatefulWidget {
  const UpgradeShipPicker(
      {super.key,
      required this.ships,
      required this.source,
      required this.currency,
      required this.state,
      this.selectedId});
  final List<UpgradeShipInfo> ships;
  final bool source;
  final String currency;
  final ShipPickerState state;
  final int? selectedId;
  @override
  State<UpgradeShipPicker> createState() => _UpgradeShipPickerState();
}

class _UpgradeShipPickerState extends State<UpgradeShipPicker> {
  late final _search = TextEditingController(text: widget.state.query);
  late final _scroll =
      ScrollController(initialScrollOffset: widget.state.offset);

  int? _price(UpgradeShipInfo ship) => ship.msrp;

  void _changed(VoidCallback change) {
    setState(change);
    widget.state.offset = 0;
    if (_scroll.hasClients) _scroll.jumpTo(0);
  }

  @override
  void dispose() {
    if (_scroll.hasClients) widget.state.offset = _scroll.offset;
    _scroll.dispose();
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final key = widget.state.query.toLowerCase().trim();
    final ships = widget.ships.where((s) {
      if (!widget.source && !(s.skus?.any((v) => v.canPurchase) ?? false)) {
        return false;
      }
      if (widget.state.restricted &&
          (widget.source
              ? s.owned != true
              : !(s.skus?.any((v) => v.isWarbond && v.canPurchase) ?? false))) {
        return false;
      }
      final words =
          '${s.name} ${s.chineseName} ${s.shipAlias?.alias.join(' ') ?? ''} ${s.manufacturer?.name ?? ''}'
              .toLowerCase();
      return key.split(RegExp(r'\s+')).every(words.contains);
    }).toList()
      ..sort((a, b) {
        final x = _price(a), y = _price(b);
        if (x == null) return y == null ? 0 : 1;
        if (y == null) return -1;
        final order = widget.state.ascending ? x.compareTo(y) : y.compareTo(x);
        return order != 0 ? order : (a.name ?? '').compareTo(b.name ?? '');
      });
    const label = '价格';
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    return Theme(
        data: theme.copyWith(
          chipTheme: theme.chipTheme.copyWith(
            backgroundColor: colors.surfaceContainerLow,
            selectedColor: colors.primary.withValues(alpha: .09),
            side: BorderSide.none,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            labelStyle:
                theme.textTheme.labelLarge?.copyWith(color: colors.onSurface),
            checkmarkColor: colors.primary,
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 8, 4),
                child: Row(children: [
                  Expanded(
                      child: Text(widget.source ? '选择起始舰船' : '选择目标舰船',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w700))),
                  IconButton(
                      tooltip: '关闭选船',
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close)),
                ])),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _search,
                  onChanged: (value) =>
                      _changed(() => widget.state.query = value),
                  decoration: InputDecoration(
                      hintText: '搜索中文名、英文名或别名',
                      filled: true,
                      fillColor: colors.surfaceContainerLow,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: widget.state.query.isEmpty
                          ? null
                          : IconButton(
                              tooltip: '清空搜索',
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _search.clear();
                                _changed(() => widget.state.query = '');
                              }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                )),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(children: [
                  ChoiceChip(
                      label: const Text('全部'),
                      selected: !widget.state.restricted,
                      onSelected: (_) =>
                          _changed(() => widget.state.restricted = false)),
                  const SizedBox(width: 8),
                  ChoiceChip(
                      label: Text(widget.source ? '已拥有' : '战争债券'),
                      selected: widget.state.restricted,
                      onSelected: (_) =>
                          _changed(() => widget.state.restricted = true)),
                  const SizedBox(width: 8),
                  ActionChip(
                      avatar: Icon(
                          widget.state.ascending
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          size: 16),
                      label: Text(
                          '$label${widget.state.ascending ? '由低到高' : '由高到低'}'),
                      onPressed: () => _changed(() =>
                          widget.state.ascending = !widget.state.ascending)),
                ])),
            Expanded(
                child: ships.isEmpty
                    ? Center(
                        child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(
                                widget.state.restricted && widget.source
                                    ? '没有匹配的已拥有舰船，可切换“全部”选择起点'
                                    : '没有匹配的舰船，试试其他名称或筛选条件',
                                textAlign: TextAlign.center)))
                    : ListView.builder(
                        controller: _scroll,
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                        itemCount: ships.length,
                        itemBuilder: (context, index) {
                          final ship = ships[index];
                          final price = _price(ship);
                          return Card(
                              elevation: 0,
                              clipBehavior: Clip.antiAlias,
                              color: ship.id == widget.selectedId
                                  ? colors.primary.withValues(alpha: .07)
                                  : colors.surface,
                              child: InkWell(
                                  onTap: () => Navigator.pop(context, ship),
                                  child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            UpgradeShipThumbnail(ship: ship),
                                            const SizedBox(width: 12),
                                            Expanded(
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                  Text(upgradeShipName(ship),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  if (ship.name !=
                                                      upgradeShipName(ship))
                                                    Text(ship.name ?? '',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                      price == null
                                                          ? '待确认'
                                                          : cartMoney(price,
                                                              widget.currency,
                                                              decimalDigits: 0),
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  if (widget.source &&
                                                      ship.owned == true)
                                                    const Text('已拥有',
                                                        style: TextStyle(
                                                            fontSize: 12)),
                                                  if (!widget.source &&
                                                      (ship.skus?.any((s) =>
                                                              s.isWarbond &&
                                                              s.canPurchase) ??
                                                          false))
                                                    const Text('可选战争债券',
                                                        style: TextStyle(
                                                            fontSize: 12)),
                                                ])),
                                            if (ship.id == widget.selectedId)
                                              const Icon(Icons.check, size: 20),
                                          ]))));
                        })),
          ]),
        ));
  }
}

class UpgradeShipThumbnail extends StatelessWidget {
  const UpgradeShipThumbnail({super.key, required this.ship});
  final UpgradeShipInfo? ship;
  @override
  Widget build(BuildContext context) {
    final url = ship?.medias?.productThumbMediumAndSmall;
    final placeholder = ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Center(child: Icon(Icons.rocket_launch_outlined)));
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
            width: 72,
            height: 56,
            child: url == null || url.isEmpty
                ? placeholder
                : CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                    placeholder: (_, __) => placeholder,
                    errorWidget: (_, __, ___) => placeholder)));
  }
}
