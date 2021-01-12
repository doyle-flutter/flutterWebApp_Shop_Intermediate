import 'package:flutter/foundation.dart';
import 'package:myshop/models/menuModel.dart';
import 'package:myshop/repos/connnet.dart';

class MenuProvider with ChangeNotifier{
  List<MenuModel> menuData;
  Connect _connect = new Connect();
  MenuProvider(){
    Future.microtask(() async => await _init());
  }

  Future<void> _init() async{
    final List _result = await _connect.get(url: "http://192.168.0.3:3000/menu");
    this.menuData = _result.map((e) => MenuModel.fromJson(e)).toList();
    notifyListeners();
    return;
  }
}