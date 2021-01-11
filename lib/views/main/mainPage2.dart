import 'package:flutter/material.dart';
import 'package:myshop/providers/mainProvider.dart';
import 'package:myshop/views/main/component/mainContentComponent.dart';
import 'package:myshop/views/main/layout/mainWebLayout.dart';
import 'package:myshop/views/pageClassWrapper/pageClass.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainPage2 extends PageClass{
  MainProvider _mainProvider;

  @override
  Widget webScaffold(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: MainWebLayOut(
      menu: (BuildContext context) => Container(
        child: Center(child: Text("MENU"),),),
      mainContent: (BuildContext context) => MainContentComponent()
    )
  );

  @override
  Widget appScaffold(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: MainContentComponent()
  );

  @override
  Widget build(BuildContext context) {
    _mainProvider = Provider.of<MainProvider>(context);
    return super.build(context);
  }
}