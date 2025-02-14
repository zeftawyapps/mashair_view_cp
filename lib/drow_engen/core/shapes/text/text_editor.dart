import 'package:flutter/material.dart';

import 'text_property.dart';
 class TextEditor extends StatefulWidget {
  TextEditor({super.key , this.text});
  String? text ;

  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
 TextEditingController textEditingController = TextEditingController();

 @override
  void initState() {
    // TODO: implement initState

   super.initState();
  }
  @override
  Widget build(BuildContext context) {
    textEditingController.text = widget.text ?? '';

   bool iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return  SingleChildScrollView(
      child: Container(
        height: iskeyboard ? 0 : 200,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('Text Editor' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold) ,
            ),
            Container(
              child: TextField(
                controller: textEditingController,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Enter your text',
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  String text = textEditingController.text;
                  Navigator.of(context).pop(
                    Texting( text),
                  );
                }
              , child: Text('اضافة نص')
              ),
      
            )
      
      
          ],
      
        ),
      ),
    );

  }
}
