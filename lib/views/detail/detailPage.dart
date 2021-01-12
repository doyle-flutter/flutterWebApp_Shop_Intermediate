import 'package:flutter/material.dart';
import 'package:myshop/providers/detailProvider.dart';
import 'package:myshop/views/commonComponent/layout/webLayout.dart';
import 'package:myshop/views/commonComponent/menuComponent.dart';
import 'package:myshop/views/pageClassWrapper/pageClass.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailPage extends PageClass{
  final String title;
  final List<Map<String, dynamic>> menuData;
  final String pid;
  final bool connCheck;
  DetailPage({@required this.title, @required this.menuData, @required this.pid, @required this.connCheck});

  DetailProvider _detailProvider;

  TextStyle _titleTxtStyle = TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white);
  final AppBar _commonAppBar = AppBar(title: Text("Detail"),);
  Widget _commonDetailWidget(BuildContext context) => _detailProvider.data == null
    ? Center(child: Text("Load.."),)
    : ListView(
      padding: EdgeInsets.all(20.0),
      controller: ScrollController(),
      children: [
        Container(child: Text("${_detailProvider.data.category} ${_detailProvider.data.scategory.isEmpty ? '' :'> ${_detailProvider.data.scategory}'}"),),
        Container(
          width: MediaQuery.of(context).size.width/2,
          height: MediaQuery.of(context).size.width/2,
          margin: EdgeInsets.symmetric(vertical: 10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(_detailProvider.data.img),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          color: Colors.blue[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(child: Text(_detailProvider.data.title, style: _titleTxtStyle,),),
              Container(child: Text("${_detailProvider.data.price} 원", style: _titleTxtStyle),),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          padding: EdgeInsets.all(20.0),
          color: Colors.blue[50],
          child: Text(_detailProvider.data.des,),
        ),
      ],
    );
  Widget _fab(BuildContext context) => _detailProvider.data == null
    ? Container()
    : FloatingActionButton(
      onPressed: () => showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(" '${_detailProvider.data.title}' 을(를) 구매하시겠습니까?"),
          actions: [
            TextButton(
              child: Text("닫기"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        )
      ) ,
      child: Icon(Icons.credit_card),
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
      endDrawer: Drawer(child: MenuComponent(menuData: this.menuData,),),
      body: _commonDetailWidget(context),
      floatingActionButton: _fab(context),
  );

  @override
  Widget webScaffold(BuildContext context) => Scaffold(
    appBar: _commonAppBar,
    body: WebLayOut(
      menu: (BuildContext context) => MenuComponent(menuData: this.menuData,),
      mainContent: (BuildContext context) => _commonDetailWidget(context)
    ),
    floatingActionButton: _fab(context),
  );
  @override
  Widget build(BuildContext context) {
    _detailProvider = Provider.of<DetailProvider>(context);
    print(_detailProvider.data);
    return super.build(context);
  }
}