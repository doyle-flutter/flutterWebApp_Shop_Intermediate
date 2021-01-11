import 'package:flutter/material.dart';

// Body LayOut
class MainWebLayOut extends StatelessWidget {
  final WidgetBuilder mainContent;
  final WidgetBuilder menu;
  const MainWebLayOut({this.mainContent, this.menu});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: this.menu(context),
        ),
        Expanded(
          flex: 4,
          child: this.mainContent(context),
        ),
      ],
    );
  }
}
