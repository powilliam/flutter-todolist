import 'package:flutter/material.dart';

class Todo extends StatelessWidget {
  Todo({ @required this.children });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children
      ),
    );
  }
}