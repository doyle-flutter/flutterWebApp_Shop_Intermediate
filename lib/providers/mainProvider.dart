// ignore: avoid_web_libraries_in_flutter
import 'dart:js';
import 'package:flutter/foundation.dart';
import 'package:myshop/repos/connnet.dart';

class MainProvider with ChangeNotifier{
  List data;
  Connect _connect = new Connect();
  MainProvider(){
    Future.microtask(() async => await _init());
  }

  Future<void> _init() async{
    this.data = await _connect.get<List>();
    // index.html 의 function _netCheck(check){} 함수 실행
    this.data == null ? context.callMethod('_netCheck',[false]) : context.callMethod('_netCheck',[true]);
    notifyListeners();
    return;
  }

}