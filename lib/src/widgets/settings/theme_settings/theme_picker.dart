import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:provider/provider.dart';
import 'package:refuge_next/src/datasource/data_model.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';


class ThemePicker extends StatelessWidget {
  final Function(FlexScheme) onThemeChanged;
  final FlexScheme currentScheme;
  final int columns;
  final double itemSize;
  final Color? selectedColor;

  const ThemePicker({
    Key? key,
    required this.onThemeChanged,
    required this.currentScheme,
    this.columns = 7,
    this.itemSize = 20.0,
    this.selectedColor,
  }) : super(key: key);

  int getColumns(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 440) {
      return 10;
    } else if (screenWidth < 440) {
      return 7;
    } else {
      return 7;
    }
  }

  List<Color> getColors(bool isDark) {
    if (isDark) {
      return FlexScheme.values
          .map((scheme) => FlexThemeData.dark(scheme: scheme).primaryColorDark)
          .toList();
    } else {
      return FlexScheme.values
          .map((scheme) => FlexThemeData.light(scheme: scheme).primaryColor)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {

    final isDarkMode = Provider.of<MainDataModel>(context).isDarkMode;
    final colors = getColors(isDarkMode);

    return GridView.builder(
      padding: const EdgeInsets.all(15),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: getColumns(context),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final color = colors[index];
        final isSelected = color == selectedColor;
        return GestureDetector(
          onTap: () => {
            onThemeChanged(FlexScheme.values[index])
          },
          child: Container(
            width: itemSize,
            height: itemSize,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(color: Colors.white, width: 3)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}