
// var menuDummy = [
//   {'name':'Home'},
//   {
//     'name':'Category',
//     'menus': [
//       "TOP",
//       "Bottom",
//       "Outer",
//       "Onepice",
//     ]
//   }
// ];

import 'package:flutter/cupertino.dart';

class MenuModel{
  final String name;
  List expansion = [];
  MenuModel({@required this.name, this.expansion});
  factory MenuModel.fromJson(e) => MenuModel(
    name: e['name'].toString(),
    expansion: e['expansion'] == null ? [] : List.of(e['expansion'])
  );
}