import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;


import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../interfaces/base_shap.dart';
import '../shapes/image/image_shap.dart';
import '../shapes/rectangel/rectangel_shap.dart';

class ImageExporter   {
  List<BaseShape> Shaps;
  RectangleShape board;
  ByteData? byteData;
  bool forPrint = false;
  bool isDouble = false;
  Canvas? _canvas ;
  ImageExporter({required this.Shaps, required this.board
  ,this.forPrint = false  , this.isDouble = false
  }) {
    board.primaryColor = Colors.white;
    // final pictureRecorder = ui .  PictureRecorder();
    // final canvas = Canvas(pictureRecorder);
    // _canvas = canvas;
  }


 Future <ByteData> paintByteData() async {
    if (forPrint) {
      return paintForPrint();
    }


    // deselect all shapes
    for (var shape in Shaps) {
      shape.isSelected = false;
    }
    final size = Size(board.width, board.height);
    final pictureRecorder =ui.  PictureRecorder();

    final canvas = Canvas(pictureRecorder);
    board.drawShape(canvas);
    for (var shape in Shaps) {
      shape.drawShape(canvas);
    }
    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(
        size.width.toInt(), size.height.toInt()); // Adjust size as needed
    final bytes = await image.toByteData(format: ui.  ImageByteFormat.png);

    return bytes!;
  }

  Future < ui.Image> paint() async {

    for (var shape in Shaps) {
      shape.isSelected = false;
    }
    final size = Size(board.width, board.height);
    final pictureRecorder = ui.  PictureRecorder();

    final canvas = Canvas(pictureRecorder);

    canvas.scale(1, -1);
    canvas.translate(0, -size.height);
    board.drawShape(canvas);
    for (var shape in Shaps) {
      shape.drawShape(canvas);
    }
    final picture = pictureRecorder.endRecording();
   return  await picture.toImage(
        size.width.toInt(), size.height.toInt()); // Adjust size as needed
  }
  Future <ByteData> paintForPrint () async {
   ui.  PictureRecorder pictureRecorder = ui. PictureRecorder();
    final canvas = Canvas(pictureRecorder);
    board.primaryColor = Colors.white;
    board.borderColor = Color(0xffC3A9CE);
    board.xPos = 0;
    board.drawShape(canvas);
    final size = Size(board.width, board.height);

    if (isDouble) {
      RectangleShape board2 = RectangleShape(
        width: board.width,
        height: board.height,
        xPos: 0,
        yPos: 0,
        primaryColor: Colors.white,
      );
      board2.borderColor = Colors.black;
      board2.drawShape(canvas);
    }


    for (var shape in Shaps) {
      if (shape is ImageShape) {
        shape.xPos = board.xPos;
        shape.width = isDouble ? board!.width /2  :  board!.width  ;
        shape.height =  board!.height  ;
      }
      shape.drawShape(canvas);
    }
    final picture = pictureRecorder.endRecording();
    final image = await picture.toImage(
        size.width.toInt(), size.height.toInt()); // Adjust size as needed
    final bytes = await image.toByteData(format: ui.  ImageByteFormat.png);

    return bytes!;
  }
  void exportFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/${DateTime.now().microsecond}.png');
    await file.writeAsBytes(byteData!.buffer.asUint8List());
  }
 Future <Uint8List> exportUint8List()async  {
  byteData = await   paintByteData();
    return byteData!.buffer.asUint8List();
  }
  Future <ByteData> exportByteData()async  {
    if (byteData == null) {
      byteData = await   paintByteData();
    }
    return byteData! ;
  }
}
