import 'package:flutter/material.dart';
import 'package:myshop/models/menuModel.dart';
import 'package:myshop/providers/menuProvider.dart';
import 'package:provider/provider.dart';
class MenuComponent extends StatelessWidget {
  final List<Map<String, dynamic>> menuData;
  MenuComponent({@required this.menuData}) : assert(menuData != null);
  List<MenuModel> menuDatas;

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
  Widget build(BuildContext context){
    MenuProvider _provider = Provider.of<MenuProvider>(context);
    return ListView(
      controller: ScrollController(),
      // children: [
      //   ListTile(
      //     title: Text(menuData[0]['name'].toString()),
      //     onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route r) => false),
      //   ),
      //   ExpansionTile(
      //     title: Text(menuData[1]['name'].toString()),
      //     children: List.of(menuData[1]['menus']).map((e) =>
      //         ListTile(
      //           title: Text(e.toString()),
      //           onTap: () => Navigator.of(context).pushNamed('/category/${e.toString()}'),
      //         )
      //     ).toList(),
      //   ),
      // ],
      children: _provider.menuData == null
        ? [Container()]
        : _provider.menuData.map<Widget>(
            (MenuModel e){
              if(e.expansion.isEmpty) return ListTile(
                title: Text(e.name),
                onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route r) => false),
              );
              else{
                return ExpansionTile(
                  title: Text(e.name),
                  children: e.expansion.map((j) => ListTile(
                    title: Text(j.toString()),
                    onTap: () => Navigator.of(context).pushNamed('/category/${j.toString()}'),
                  )).toList()
                );
              }
            }
          ).toList(),
    );
  }
}
