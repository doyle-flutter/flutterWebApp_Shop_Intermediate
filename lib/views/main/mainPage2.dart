import 'package:flutter/material.dart';
import 'package:myshop/providers/mainProvider.dart';
import 'package:myshop/views/commonComponent/layout/webLayout.dart';
import 'package:myshop/views/commonComponent/menuComponent.dart';
import 'package:myshop/views/main/component/mainContentComponent.dart';
import 'package:myshop/views/pageClassWrapper/pageClass.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainPage2 extends PageClass{
  MainProvider _mainProvider;
  final List<Map<String,dynamic>> menuData;
  MainPage2({@required this.menuData}):assert(menuData != null);

  AppBar _commonAppBar = AppBar(title: Text("Flutter WEB & APP(And / IOS)"));

  @override
  Widget webScaffold(BuildContext context) => Scaffold(
    appBar: _commonAppBar,
    body: WebLayOut(
      menu: (BuildContext context) => MenuComponent(menuData: this.menuData,),
      mainContent: (BuildContext context) => MainContentComponent(
        ea: _mainProvider?.data?.length ?? 0,
        crossAxisCount: 5,
        data: _mainProvider?.data ?? []
      )
    )
  );

  @override
  Widget appScaffold(BuildContext context) => Scaffold(
    appBar: _commonAppBar,
    drawer: Drawer(
      child: MenuComponent(menuData: this.menuData,),
    ),
    body: MainContentComponent(crossAxisCount: 2,ea: _mainProvider?.data?.length ?? 0, data: _mainProvider?.data ?? [],)
  );

  @override
  Widget build(BuildContext context) {
    _mainProvider = Provider.of<MainProvider>(context);
    return super.build(context);
  }
}