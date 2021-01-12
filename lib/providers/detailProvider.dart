import 'package:flutter/foundation.dart';
import 'package:myshop/models/viewDataModel.dart';
import 'package:myshop/repos/connnet.dart';

class DetailProvider with ChangeNotifier{
  ViewDataModel data;
  String pid;
  DetailProvider({@required this.pid}){
   Future.microtask(() async => await this._init(this.pid));
  }
  Connect _connect = new Connect();

  Future<void> _init(String pid) async{
    final List _result = await _connect.get<List>(url: 'http://192.168.0.3:3000/item/$pid');
    this.data = ViewDataModel.fromJson(_result[0]);
    notifyListeners();
    return;
  }
}