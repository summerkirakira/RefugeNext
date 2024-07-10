import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math' as math;
import 'package:flutter/material.dart';

// 通过[Uint8List]获取图片
Future<ui.Image> loadImageByUint8List(Uint8List list) async {
  ui.Codec codec = await ui.instantiateImageCodec(list);
  ui.FrameInfo frame = await codec.getNextFrame();
  return frame.image;
}

// 图片加文字水印（右下角）
Future<Uint8List> imageAddWaterMark(Uint8List list, String textStr) async {
  int width, height;

  // 拿到Canvas
  ui.PictureRecorder recorder = new ui.PictureRecorder();
  Canvas canvas = new Canvas(recorder);

  // 拿到Image对象
  ui.Image image = await loadImageByUint8List(list);
  width = image.width;
  height = image.height;

  // 绘制原始图片
  canvas.drawImage(image, Offset(0, 0), Paint());

  // 设置水印文本样式
  var textPainter = TextPainter(
    text: TextSpan(
      text: textStr,
      style: TextStyle(
        fontSize: 40,
        fontFamily: 'Roboto',
        color: Colors.black.withOpacity(0.5),
        backgroundColor: Colors.transparent,
      ),
    ),
    textDirection: ui.TextDirection.ltr,
  );

  // 布局文本
  textPainter.layout();

  // 计算文本位置
  double textX = width - textPainter.width - 10; // 右边距10
  double textY = height - textPainter.height - 10; // 底边距10

  // 绘制文本
  textPainter.paint(canvas, Offset(textX, textY));

  // 结束录制并生成图片
  ui.Picture picture = recorder.endRecording();
  final img = await picture.toImage(width.toInt(), height.toInt());

  // 将图片转换为字节数据
  final pngBytes = await img.toByteData(format: ui.ImageByteFormat.png);

  return pngBytes!.buffer.asUint8List();
}
