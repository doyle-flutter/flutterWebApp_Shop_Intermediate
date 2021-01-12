import 'dart:js' as web;
import 'package:flutter/foundation.dart';
import 'package:myshop/models/viewDataModel.dart';
import 'package:myshop/repos/connnet.dart';

class MainProvider with ChangeNotifier{
  List<ViewDataModel> data;
  Connect _connect = new Connect();
  MainProvider(){
    Future.microtask(() async => await _init());
  }

  Future<void> _init() async{
    List _result = await _connect.get<List>(url: "http://192.168.0.3:3000/");
    if(_result == null) return;
    this.data = _result.map((json) => ViewDataModel.fromJson(json)).toList();
    // index.html 의 function _netCheck(check){} 함수 실행
    this.data == null
      ? web.context.callMethod('_netCheck',[false])
      : web.context?.callMethod('_netCheck',[true]);
    notifyListeners();
    return;
  }

}