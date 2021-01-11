import 'dart:convert';
import 'package:http/http.dart' as http;

class Connect{
  final String _url = "http://192.168.0.3:3000";
  Future<T> get<T>() async{
    try{
      print("REQ TRY");
      final http.Response _res = await http.get(_url)
        .timeout(Duration(seconds: 11), onTimeout: () => http.Response('null',404))
        .catchError((Object obj) => null, test: (Object error) => true);
      print(_res.body);
      return json.decode(_res.body);
    }
    catch(e){
      print("GET REQ ERROR");
      return null;
    }
  }
  Future<T> post<T>({Map<String, String> headers, Map<String, dynamic> body}) async{
    try{
      final http.Response _res = await http.post(_url)
          .timeout(Duration(seconds: 11), onTimeout: () => http.Response('null',404))
          .catchError((Object obj) => null, test: (Object error) => false);
      print("POST REQ TRY");
      print(_res.body);
      return json.decode(_res.body);
    }
    catch(e){
      print("POST REQ ERROR");
      return null;
    }
  }
}