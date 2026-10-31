import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/material.dart';
import '../../datasource/models/hangar.dart';
import '../../datasource/models/searchProperty.dart';
import 'hangar_filter_options.dart';

/// A single screen-wide row; all conditions remain reachable by horizontal drag.
class HangarFilterBar extends StatefulWidget {
  const HangarFilterBar(
      {super.key,
      required this.property,
      required this.items,
      required this.onApply,
      required this.onClear,
      required this.onEdit});
  final SearchProperty property;
  final List<HangarItem> items;
  final Future<bool> Function(SearchProperty) onApply;
  final VoidCallback onClear;
  final VoidCallback onEdit;

  @override
  State<HangarFilterBar> createState() => _HangarFilterBarState();
}

class _HangarFilterBarState extends State<HangarFilterBar> {
  bool _busy = false;

  Future<void> _remove(HangarFilterToken token) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await widget.onApply(token.removedFrom(widget.property));
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('筛选未更新，请重试')));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    final foreground =
        _busy ? colors.onSurface.withValues(alpha: .38) : colors.primary;
    final labelStyle = theme.textTheme.labelMedium!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: foreground,
    );
    final tokens = hangarFilterTokens(widget.property, widget.items);
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: theme.colorScheme.surface,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.stylus
            },
          ),
          child: SingleChildScrollView(
            key: const ValueKey('hangar-filter-scroll'),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(children: [
              for (final token in tokens)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: InputChip(
                    key: ValueKey('active-${token.key}'),
                    // Material 2 reads these fields instead of the state color.
                    backgroundColor: Color.alphaBlend(
                        colors.primary.withValues(alpha: dark ? .14 : .08),
                        colors.surface),
                    disabledColor: Color.alphaBlend(
                        colors.onSurface.withValues(alpha: .05),
                        colors.surface),
                    color: theme.useMaterial3
                        ? WidgetStateProperty.resolveWith((states) {
                            if (states.contains(WidgetState.disabled)) {
                              return Color.alphaBlend(
                                  colors.onSurface.withValues(alpha: .05),
                                  colors.surface);
                            }
                            final alpha = states.contains(WidgetState.pressed)
                                ? (dark ? .22 : .16)
                                : states.contains(WidgetState.hovered) ||
                                        states.contains(WidgetState.focused)
                                    ? (dark ? .18 : .12)
                                    : (dark ? .14 : .08);
                            return Color.alphaBlend(
                                colors.primary.withValues(alpha: alpha),
                                colors.surface);
                          })
                        : null,
                    side: BorderSide(
                      color: _busy
                          ? colors.onSurface.withValues(alpha: .12)
                          : colors.primary.withValues(alpha: dark ? .30 : .20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                    pressElevation: 0,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    visualDensity: VisualDensity.standard,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                    label: Text(token.label, maxLines: 1, style: labelStyle),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    deleteIconColor: foreground,
                    deleteButtonTooltipMessage: '移除${token.label}',
                    onDeleted: _busy ? null : () => _remove(token),
                    onPressed: _busy ? null : widget.onEdit,
                  ),
                ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: colors.primary,
                  textStyle: labelStyle.copyWith(color: colors.primary),
                ),
                onPressed: widget.onClear,
                child: const Text('清除全部'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
