import 'package:flutter/material.dart';
class MenuComponent extends StatelessWidget {
  final List<Map<String, dynamic>> menuData;
  const MenuComponent({@required this.menuData}) : assert(menuData != null);

  @override
  // Widget build(BuildContext context) => ListView.builder(
  //   controller: ScrollController(),
  //   itemCount: this.menuData.length,
  //   itemBuilder: (BuildContext context, int index) => ListTile(
  //     title: Text(menuData[index]['name'].toString()),
  //     onTap: (){
  //       if(menuData[index]['name'].toString() == 'home') return Navigator.of(context).pushNamedAndRemoveUntil('/',(Route r) => false);
  //       return Navigator.of(context).pushNamed('/${menuData[index]['name'].toString()}');
  //     },
  //   )
  // );
  Widget build(BuildContext context) => ListView(
    controller: ScrollController(),
    children: [
      ListTile(
        title: Text(menuData[0]['name'].toString()),
        onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route r) => false),
      ),
      ExpansionTile(
        title: Text(menuData[1]['name'].toString()),
        children: List.of(menuData[1]['menus']).map((e) =>
          ListTile(
            title: Text(e.toString()),
            onTap: () => Navigator.of(context).pushNamed('/category/${e.toString()}'),
          )
        ).toList(),
      ),
    ],
  );
}
