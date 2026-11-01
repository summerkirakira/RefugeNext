import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/material.dart';
import '../../datasource/models/shop_search_property.dart';
import 'shop_filter_options.dart';

/// A single screen-wide row; all conditions remain reachable by horizontal drag.
class ShopFilterBar extends StatelessWidget {
  const ShopFilterBar(
      {super.key,
      required this.property,
      required this.onApply,
      required this.onClear,
      required this.onEdit});
  final ShopSearchProperty property;
  final ValueChanged<ShopSearchProperty> onApply;
  final VoidCallback onClear;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final dark = theme.brightness == Brightness.dark;
    final foreground = colors.primary;
    final labelStyle = theme.textTheme.labelMedium!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: foreground,
    );
    final tokens = shopFilterTokens(property);
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
            key: const ValueKey('shop-filter-scroll'),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(children: [
              for (final token in tokens)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: InputChip(
                    key: ValueKey('shop-active-${token.field.name}'),
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
                      color: colors.primary.withValues(alpha: dark ? .30 : .20),
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
                    onDeleted: () => onApply(token.removedFrom(property)),
                    onPressed: onEdit,
                  ),
                ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: colors.primary,
                  textStyle: labelStyle.copyWith(color: colors.primary),
                ),
                onPressed: onClear,
                child: const Text('清除全部'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
