 import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
class PainDialoge extends StatefulWidget {
   PainDialoge({super.key  , required this.imageUint8List});

 Uint8List imageUint8List;
  @override
  State<PainDialoge> createState() => _PainDialogeState();
}

class _PainDialogeState extends State<PainDialoge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.memory(widget.imageUint8List ),
      ),
    );
  }
}
