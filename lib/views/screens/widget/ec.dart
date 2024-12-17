

import 'package:flutter/material.dart';

class Ec extends StatefulWidget {
  void Function(String word) onRearrange;

  var word;
   Ec(this.onRearrange, this.word, {super.key});

  @override
  State<Ec> createState() => _EcState();
}

class _EcState extends State<Ec> {
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        if(!isclicked){
          setState(() {
            isclicked=true;
          });
          widget.onRearrange(widget.word);
        }
      },
      child: Card(
        surfaceTintColor: isclicked?Colors.black:null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.word, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
