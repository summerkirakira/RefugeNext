import 'dart:io';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:refuge_next/src/datasource/models/hangar.dart';
import 'package:intl/intl.dart';
import 'package:refuge_next/src/funcs/toast.dart';
import 'package:refuge_next/src/repo/translation.dart';

import '../../repo/ship_alias.dart';



Future<void> generateUpgradeHangarExcelTable(List<HangarItem> hangarItems, String userName) async {
  var excel = Excel.createExcel();
  Sheet sheet = excel['Sheet1'];
  sheet.merge(CellIndex.indexByString('A1'), CellIndex.indexByString('Q1'));

  // 设置标题行的样式 (可选)
  CellStyle titleStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 14,
    horizontalAlign: HorizontalAlign.Center, // 居中对齐
    verticalAlign: VerticalAlign.Center,
    bold: true,
  );

  final String currentDate = DateFormat('yyyy.MM.dd').format(DateTime.now());

  sheet.updateCell(CellIndex.indexByString('A1'), TextCellValue('$userName的机库内CCU一览表 (更新时间: $currentDate)   Powered by 星河避难所Next'), cellStyle: titleStyle);


  // 设置表头
  List<String> headers = [
    '数量', '物品名', '起始船(中)', '起始船(英)', '终点船(中)', '终点船(英)',
    '入库时间', '机库所在页', '可礼物', '可融', '内含',
    '起始价格(\$)', '终点价格(\$)', '可融价值(\$)', '当前价值(\$)', '节约(\$)', '节约率(%)'
  ];

  // 设置表头样式 (可选)
  CellStyle headerStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 10,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
    bold: true,
  );

  // 应用表头样式到所有表头单元格
  for (int i = 0; i < headers.length; i++) {
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: 1, columnIndex: i), TextCellValue(headers[i]), cellStyle: headerStyle);
  }

  // 设置数据行样式 (可选)
  CellStyle dataStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 10,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
  );
  int colIndex = 0;
  int rowIndex = 2; // 从第二行开始写入数据

  writeUpgradeInfoByHangarItems(sheet, hangarItems, rowIndex, colIndex, dataStyle);


  // 保存 Excel 文件
  try {
    List<int>? bytes = excel.encode();
    if (bytes != null) {
      Directory? appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/Hangar_Report.xlsx';
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
      showToast(message: '机库导出成功！文件被保存到: $filePath');

      // Open the file based on the platform
      await _openFile(filePath);

    }
  } catch (e) {
    showAlert(message: '导出机库失败: $e');
  }
}



Future<void> generateGeneralExcelTable(List<HangarItem> hangarItems, String userName) async {
  var excel = Excel.createExcel();
  Sheet sheet = excel['Sheet1'];
  sheet.merge(CellIndex.indexByString('A1'), CellIndex.indexByString('P1'));

  // 设置标题行的样式 (可选)
  CellStyle titleStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 14,
    horizontalAlign: HorizontalAlign.Center, // 居中对齐
    verticalAlign: VerticalAlign.Center,
    bold: true,
  );

  final String currentDate = DateFormat('yyyy.MM.dd').format(DateTime.now());

  sheet.updateCell(CellIndex.indexByString('A1'), TextCellValue('$userName的机库内物品一览表 (更新时间: $currentDate)   Powered by 星河避难所Next'), cellStyle: titleStyle);


  // 设置表头
  List<String> headers = [
    '数量', '物品id列表', '物品名(中)', '物品名(英)', '入库时间', '机库所在页', '可礼物', '可融', '内含', '状态', '保险', '是否升级', '也包含', '可融价值(\$)', '当前价值(\$)', '节约(\$)', '节约率(%)'
  ];

  // 设置表头样式 (可选)
  CellStyle headerStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 10,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
    bold: true,
  );

  // 应用表头样式到所有表头单元格
  for (int i = 0; i < headers.length; i++) {
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: 1, columnIndex: i), TextCellValue(headers[i]), cellStyle: headerStyle);
  }

  // 设置数据行样式 (可选)
  CellStyle dataStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 10,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
  );
  int colIndex = 0;
  int rowIndex = 2; // 从第二行开始写入数据

  writeHangarInfoByHangarItems(sheet, hangarItems, rowIndex, colIndex, dataStyle);


  // 保存 Excel 文件
  try {
    List<int>? bytes = excel.encode();
    if (bytes != null) {
      Directory? appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/Hangar_Report.xlsx';
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
      showToast(message: '机库导出成功！文件被保存到: $filePath');

      // Open the file based on the platform
      await _openFile(filePath);

    }
  } catch (e) {
    showAlert(message: '导出机库失败: $e');
  }
}


void writeHangarInfoByHangarItems(Sheet sheet, List<HangarItem> hangarItems, int rowIndex, int colIndex, CellStyle dataStyle) {
  int currentColIndex = colIndex;
  int currentRowIndex = rowIndex;
  for (var hangarItem in hangarItems) {
    currentColIndex = colIndex;
    final chineseName = hangarItem.chineseName ?? hangarItem.name;
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.number), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.idList.join(",")), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(chineseName), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.name), cellStyle: dataStyle);

    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.date.toString()), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.page), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), BoolCellValue(hangarItem.canGit), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), BoolCellValue(hangarItem.canReclaim), cellStyle: dataStyle);

    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.items.map(
      (item) => item.chineseTitle ?? item.title).join(",")
    ), cellStyle: dataStyle);

    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.status), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.insurance), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), BoolCellValue(hangarItem.isUpgrade), cellStyle: dataStyle);


    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.chineseAlsoContains!.split("#").join(",")), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.price ~/ 100), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.currentPrice ~/ 100), cellStyle: dataStyle);
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue((hangarItem.currentPrice - hangarItem.price) ~/ 100), cellStyle: dataStyle);
    if (hangarItem.currentPrice != 0) {
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue("-${((hangarItem.currentPrice - hangarItem.price) / (hangarItem.currentPrice) * 100).toInt()}%"), cellStyle: dataStyle);
    } else {
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue("-"), cellStyle: dataStyle);
    }

    currentRowIndex++;
  }

}




void writeUpgradeInfoByHangarItems(Sheet sheet, List<HangarItem> hangarItems, int rowIndex, int colIndex, CellStyle dataStyle) {
  int currentColIndex = colIndex;
  int currentRowIndex = rowIndex;
  for (var hangarItem in hangarItems) {
    currentColIndex = colIndex;
    if (hangarItem.isUpgrade) {
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.number), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.chineseName!), cellStyle: dataStyle);
      if (hangarItem.fromShip != null) {
        if (hangarItem.fromShip!.chineseName != null) {
          sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.fromShip!.chineseName!), cellStyle: dataStyle);
        } else {
          sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(''), cellStyle: dataStyle);
        }
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.fromShip!.name), cellStyle: dataStyle);
      } else {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(''), cellStyle: dataStyle);
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(''), cellStyle: dataStyle);
      }
      if (hangarItem.toShip != null) {
        if (hangarItem.toShip!.chineseName != null) {
          sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.toShip!.chineseName!), cellStyle: dataStyle);
        } else {
          sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(''), cellStyle: dataStyle);
        }
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.toShip!.name), cellStyle: dataStyle);
      } else {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(''), cellStyle: dataStyle);
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(''), cellStyle: dataStyle);
      }

      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.date.toString()), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.page), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), BoolCellValue(hangarItem.canGit), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), BoolCellValue(hangarItem.canReclaim), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.alsoContains), cellStyle: dataStyle);
      // sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.insurance), cellStyle: dataStyle);

      if (hangarItem.fromShip != null) {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.fromShip!.getHighestSku() ~/ 100), cellStyle: dataStyle);
      } else {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(0), cellStyle: dataStyle);
      }
      if (hangarItem.toShip != null) {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.toShip!.getHighestSku() ~/ 100), cellStyle: dataStyle);
      } else {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(0), cellStyle: dataStyle);
      }
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.price ~/ 100), cellStyle: dataStyle);
      if (hangarItem.fromShip != null && hangarItem.toShip != null) {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue((hangarItem.toShip!.getHighestSku() - hangarItem.fromShip!.getHighestSku()) ~/ 100) , cellStyle: dataStyle);
      } else {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(0), cellStyle: dataStyle);
      }
      if (hangarItem.fromShip != null && hangarItem.toShip != null) {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue((hangarItem.toShip!.getHighestSku() - hangarItem.fromShip!.getHighestSku() - hangarItem.price) ~/ 100) , cellStyle: dataStyle);
      } else {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(0), cellStyle: dataStyle);
      }

      if (hangarItem.currentPrice != 0) {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue("-${((hangarItem.currentPrice - hangarItem.price) / (hangarItem.currentPrice) * 100).toInt()}%"), cellStyle: dataStyle);
      } else {
        sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue("-"), cellStyle: dataStyle);
      }
      currentRowIndex++;
    }
  }
}


Future<void> generateShipExcelTable(List<HangarItem> hangarItems, String userName) async {
  var excel = Excel.createExcel();
  Sheet sheet = excel['Sheet1'];
  sheet.merge(CellIndex.indexByString('A1'), CellIndex.indexByString('M1'));

  // 设置标题行的样式 (可选)
  CellStyle titleStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 14,
    horizontalAlign: HorizontalAlign.Center, // 居中对齐
    verticalAlign: VerticalAlign.Center,
    bold: true,
  );

  final String currentDate = DateFormat('yyyy.MM.dd').format(DateTime.now());

  sheet.updateCell(CellIndex.indexByString('A1'), TextCellValue('$userName的机库内舰船一览表 (更新时间: $currentDate)   Powered by 星河避难所Next'), cellStyle: titleStyle);


  // 设置表头
  List<String> headers = [
    '数量', '舰船名(中)', '舰船名(英)', '入库时间', '机库所在页', '可礼物', '可融', '状态', '保险', '可融价值(\$)', '当前价值(\$)', '节约(\$)', '节约率(%)'
  ];

  // 设置表头样式 (可选)
  CellStyle headerStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 10,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
    bold: true,
  );

  // 应用表头样式到所有表头单元格
  for (int i = 0; i < headers.length; i++) {
    sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: 1, columnIndex: i), TextCellValue(headers[i]), cellStyle: headerStyle);
  }

  // 设置数据行样式 (可选)
  CellStyle dataStyle = CellStyle(
    fontFamily: getFontFamily(FontFamily.Calibri),
    fontSize: 10,
    horizontalAlign: HorizontalAlign.Center,
    verticalAlign: VerticalAlign.Center,
  );
  int colIndex = 0;
  int rowIndex = 2; // 从第二行开始写入数据

  writeShipInfoByHangarItems(sheet, hangarItems, rowIndex, colIndex, dataStyle);


  // 保存 Excel 文件
  try {
    List<int>? bytes = excel.encode();
    if (bytes != null) {
      Directory? appDocDir = await getApplicationDocumentsDirectory();
      String filePath = '${appDocDir.path}/Hangar_Report.xlsx';
      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(bytes);
      showToast(message: '机库导出成功！文件被保存到: $filePath');

      // Open the file based on the platform
      await _openFile(filePath);

    }
  } catch (e) {
    showAlert(message: '导出机库失败: $e');
  }
}


String shipMapKey(String shipName, HangarItem hangarItem) {
  return "${shipName}#${hangarItem.date}#${hangarItem.canGit}#${hangarItem.canReclaim}#${hangarItem.status}#${hangarItem.insurance}#${(hangarItem.currentPrice - hangarItem.price) / (hangarItem.currentPrice)}";
}

void writeShipInfoByHangarItems(Sheet sheet, List<HangarItem> hangarItems, int rowIndex, int colIndex, CellStyle dataStyle) {
  int currentColIndex = colIndex;
  int currentRowIndex = rowIndex;
  Map<String, int> shipCountMap = {};
  Map<String, HangarItem> shipMap = {};
  for (var hangarItem in hangarItems) {
    if (hangarItem.isUpgrade) {
      continue;
    }
    for (var item in hangarItem.items) {
      final ship = ShipAliasRepo().getShipAliasSync(item.title);
      if (ship != null) {
        shipCountMap[shipMapKey(ship.name, hangarItem)] =
            (shipCountMap[ship.name] ?? 0) + hangarItem.number;
        shipMap[shipMapKey(ship.name, hangarItem)] = hangarItem;
      }
    }
  }
  shipCountMap.forEach(
    (key, value) {
      currentColIndex = colIndex;
      final shipName = key.split("#")[0];
      final ship = ShipAliasRepo().getShipAliasSync(shipName)!;
      final hangarItem = shipMap[key]!;

      final shipChineseName = TranslationRepo().getTranslationSync(ship.name);
      final saveRate = (hangarItem.currentPrice - hangarItem.price) / (hangarItem.currentPrice);
      final originalPrice = ship.getHighestSku();
      final currentPrice = (originalPrice * (1 - saveRate)).toInt();

      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(value), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(shipChineseName), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(shipName), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.date), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(hangarItem.page), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), BoolCellValue(hangarItem.canGit), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), BoolCellValue(hangarItem.canReclaim), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.status), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue(hangarItem.insurance), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(currentPrice ~/ 100), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue(originalPrice ~/ 100), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), IntCellValue((currentPrice - originalPrice) ~/ 100), cellStyle: dataStyle);
      sheet.updateCell(CellIndex.indexByColumnRow(rowIndex: currentRowIndex, columnIndex: currentColIndex++), TextCellValue("-${(saveRate * 100).toInt()}%"), cellStyle: dataStyle);

      currentRowIndex++;
    });
}
























// Helper function to open the file
Future<void> _openFile(String filePath) async {
  try {
    if (Platform.isAndroid || Platform.isIOS) {
      // For Android and iOS, use the open_file package
      print('Attempting to open file on mobile: $filePath');
      final OpenResult result = await OpenFile.open(filePath);

      // Check the result
      if (result.type == ResultType.done) {
        print('File opened successfully.');
      } else {
        print('Error opening file: ${result.message}');
        print('Result type: ${result.type}');
        // Handle specific errors:
        // result.type == ResultType.noAppToOpen
        // result.type == ResultType.fileNotFound
        // result.type == ResultType.permissionDenied
      }
    } else if (Platform.isMacOS) {
      await Process.run('open', [filePath], runInShell: true);
      print('Attempting to open file on macOS: $filePath');
    } else if (Platform.isWindows) {
      await Process.run('cmd', ['/c', 'start', '""', filePath], runInShell: false);
      print('Attempting to open file on Windows: $filePath');
    } else if (Platform.isLinux) {
      await Process.run('xdg-open', [filePath], runInShell: true);
      print('Attempting to open file on Linux: $filePath');
    } else {
      print('File opening not supported on this platform or not implemented.');
    }
  } catch (e) {
    print('An exception occurred while trying to open the file: $e');
    print('File path that failed to open: $filePath');
  }
}