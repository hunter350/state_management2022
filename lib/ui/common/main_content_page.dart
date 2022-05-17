import 'package:flutter/material.dart';

class MainContentPage extends StatelessWidget {
  final Widget leftSide;
  final Widget rightSide;
   String title = '';

  MainContentPage( {Key? key, required this.title, required this.leftSide, required this.rightSide}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(child: leftSide),
            Expanded(child: rightSide),
          ],
        ),
         Text('$title', style: TextStyle(fontSize: 24)),
      ],
    );
  }
}
