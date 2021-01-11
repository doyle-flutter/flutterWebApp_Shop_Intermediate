import 'package:flutter/material.dart';
import 'package:myshop/views/commonComponent/layout/webLayout.dart';
import 'package:myshop/views/commonComponent/menuComponent.dart';
import 'package:myshop/views/pageClassWrapper/pageClass.dart';

// ignore: must_be_immutable
class DetailPage extends PageClass{
  final String title;
  final List<Map<String, String>> menuData;
  DetailPage({@required this.title, @required this.menuData});

  final AppBar _commonAppBar = AppBar(title: Text(""),);
  final Widget _commonDetailWidget = Column(
    children: [
      Container(child: Text("ITEM"),),
    ],
  );

  @override
  Widget appScaffold(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: MenuComponent(menuData: this.menuData,),
      ),
      body: _commonDetailWidget
  );

  @override
  Widget webScaffold(BuildContext context) => Scaffold(
    appBar: _commonAppBar,
    body: WebLayOut(
      menu: (BuildContext context) => MenuComponent(menuData: this.menuData,),
      mainContent: (BuildContext context) => _commonDetailWidget
    )
  );

}