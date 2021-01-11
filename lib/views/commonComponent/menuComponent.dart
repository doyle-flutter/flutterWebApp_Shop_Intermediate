import 'package:flutter/material.dart';
class MenuComponent extends StatelessWidget {
  final List<Map<String, String>> menuData;
  const MenuComponent({@required this.menuData}) : assert(menuData != null);

  @override
  Widget build(BuildContext context) => ListView.builder(
    controller: ScrollController(),
    itemCount: this.menuData.length,
    itemBuilder: (BuildContext context, int index) => ListTile(
      title: Text(menuData[index]['name'].toString()),
      onTap: (){
        if(menuData[index]['name'].toString() == 'home') return Navigator.of(context).pushNamedAndRemoveUntil('/',(Route r) => false);
        return Navigator.of(context).pushNamed('/${menuData[index]['name'].toString()}');
      },
    )
  );
}
