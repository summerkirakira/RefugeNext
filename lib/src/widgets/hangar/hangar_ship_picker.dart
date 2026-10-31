import 'package:flutter/material.dart';
import '../../datasource/models/hangar.dart';

class HangarShipChoice {
  const HangarShipChoice(this.id, this.name, this.label, this.aliases);
  final String id;
  final String name;
  final String label;
  final List<String> aliases;

  bool matches(String query) {
    final key = query.trim().toLowerCase();
    return [id, name, label, ...aliases]
        .any((text) => text.toLowerCase().contains(key));
  }
}

List<HangarShipChoice> hangarShipChoices(List<HangarItem> items,
    {required bool from}) {
  final choices = <String, HangarShipChoice>{};
  for (final item in items) {
    final ship = from ? item.fromShip : item.toShip;
    if (ship == null) continue;
    choices[ship.id.toString()] = HangarShipChoice(
        ship.id.toString(),
        ship.name,
        ship.chineseName?.isNotEmpty == true ? ship.chineseName! : ship.name,
        ship.alias);
  }
  return choices.values.toList();
}

Future<List<String>?> showHangarShipPicker(
  BuildContext context, {
  required String title,
  required List<HangarShipChoice> choices,
  required List<String> selected,
}) =>
    showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * .72,
          child: HangarShipPicker(
              title: title, choices: choices, selected: selected),
        ),
      ),
    );

class HangarShipPicker extends StatefulWidget {
  const HangarShipPicker(
      {super.key,
      required this.title,
      required this.choices,
      required this.selected});
  final String title;
  final List<HangarShipChoice> choices;
  final List<String> selected;

  @override
  State<HangarShipPicker> createState() => _HangarShipPickerState();
}

class _HangarShipPickerState extends State<HangarShipPicker> {
  late final Set<String> _selected =
      widget.selected.where((id) => id != 'all').toSet();
  final _query = TextEditingController();

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final choices = {for (final choice in widget.choices) choice.id: choice};
    for (final id in _selected) {
      choices.putIfAbsent(
          id, () => HangarShipChoice(id, '', 'ID $id', const []));
    }
    final filtered = choices.values
        .where((ship) => ship.matches(_query.text))
        .toList()
      ..sort((a, b) {
        final selectedOrder = (_selected.contains(b.id) ? 1 : 0) -
            (_selected.contains(a.id) ? 1 : 0);
        return selectedOrder != 0 ? selectedOrder : a.label.compareTo(b.label);
      });
    return Material(
      color: colors.surface,
      child: SafeArea(
          top: false,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 0),
              child: Row(children: [
                Expanded(
                    child: Text(widget.title,
                        style: Theme.of(context).textTheme.titleLarge)),
                IconButton(
                    tooltip: '取消舰船选择',
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextField(
                key: const ValueKey('hangar-ship-query'),
                controller: _query,
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: '搜索中英文舰名',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _query.text.isEmpty
                      ? null
                      : IconButton(
                          tooltip: '清空舰船搜索',
                          icon: const Icon(Icons.close),
                          onPressed: () => setState(_query.clear),
                        ),
                ),
              ),
            ),
            Expanded(
                child: filtered.isEmpty
                    ? const Center(child: Text('没有匹配的舰船'))
                    : ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final ship = filtered[index];
                          return CheckboxListTile(
                            key: ValueKey('ship-choice-${ship.id}'),
                            value: _selected.contains(ship.id),
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Text(ship.label),
                            subtitle:
                                ship.name.isEmpty || ship.name == ship.label
                                    ? null
                                    : Text(ship.name),
                            onChanged: (selected) => setState(() {
                              if (selected == true) {
                                _selected.add(ship.id);
                              } else {
                                _selected.remove(ship.id);
                              }
                            }),
                          );
                        },
                      )),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 20, 12),
              child: Row(children: [
                TextButton(
                    onPressed: () => setState(_selected.clear),
                    child: const Text('清空选择')),
                const Spacer(),
                FilledButton(
                  onPressed: () => Navigator.pop(context,
                      _selected.isEmpty ? <String>['all'] : _selected.toList()),
                  child: Text(
                      _selected.isEmpty ? '完成' : '完成（${_selected.length}）'),
                ),
              ]),
            ),
          ])),
    );
  }
}
