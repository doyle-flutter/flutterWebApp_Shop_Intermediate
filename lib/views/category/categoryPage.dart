import 'package:flutter/material.dart';
import 'package:myshop/providers/categoryProvider.dart';
import 'package:myshop/views/commonComponent/layout/webLayout.dart';
import 'package:myshop/views/commonComponent/menuComponent.dart';
import 'package:myshop/views/main/component/mainContentComponent.dart';
import 'package:myshop/views/pageClassWrapper/pageClass.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryPage extends PageClass{
  final String path;
  CategoryPage({this.path});
  CategoryProvider _provider;

  @override
  Widget appScaffold(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(_provider.path),
      leading: Container(
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
    ),
    endDrawer: Drawer(child: MenuComponent(menuData: [],),),
    body: (_provider == null || _provider.data == null)
      ? Container(child: Text('load...'),)
      : MainContentComponent(
          crossAxisCount: 3,
          ea: _provider.data.length,
          data: _provider.data
        ),
  );

  @override
  Widget webScaffold(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(_provider.path),),
    body: WebLayOut(
      menu: (context) => MenuComponent(menuData: [],),
      mainContent: (context) => (_provider == null || _provider.data == null)
        ? Container(child: Text('load...'),)
        : MainContentComponent(
            crossAxisCount: 5,
            ea: _provider.data.length,
            data: _provider.data
          ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<CategoryProvider>(context);
    return super.build(context);
  }
}