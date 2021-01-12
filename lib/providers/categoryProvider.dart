import 'package:flutter/foundation.dart';
import 'package:myshop/models/viewDataModel.dart';
import 'package:myshop/repos/connnet.dart';

class CategoryProvider with ChangeNotifier{
  Connect _connect = new Connect();
  List<ViewDataModel> data;
  final String path;
  CategoryProvider({this.path}){
    Future.microtask(() async => await _init());
  }
  Future<void> _init() async{
    final List _result = await _connect.get(url: "http://192.168.0.3:3000/category/${this.path}");
    this.data = _result.map((e) => ViewDataModel.fromJson(e)).toList();
    notifyListeners();
    return;
  }
}