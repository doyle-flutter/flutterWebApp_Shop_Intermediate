import 'dart:convert';
import 'package:http/http.dart' as http;

class Connect{
  Future<T> get<T>({String url = "http://127.0.0.1:3000"}) async{
    try{
      print("REQ TRY : $url");
      final http.Response _res = await http.get(url)
        .timeout(Duration(seconds: 11), onTimeout: () => http.Response('null',404))
        .catchError((Object obj) => null, test: (Object error) => true);
      print("_res.body : ${_res.body}");
      return json.decode(_res.body);
    }
    catch(e){
      print("GET REQ ERROR");
      return null;
    }
  }
  Future<T> post<T>({String url = "http://127.0.0.1:3000", Map<String, String> headers, Map<String, dynamic> body}) async{
    try{
      final http.Response _res = await http.post(url)
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