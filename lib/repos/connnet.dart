import 'dart:convert';
import 'package:http/http.dart' as http;

class Connect{
  Future<T> get<T>({String url = "http://127.0.0.1:3000"}) async{
    try{
      final http.Response _res = await http.get(url)
        .timeout(Duration(seconds: 11), onTimeout: () => http.Response('null',404))
        .catchError((Object obj) => null, test: (Object error) => true);
      return json.decode(_res.body);
    }
    catch(e){
      return null;
    }
  }
  Future<T> post<T>({String url = "http://127.0.0.1:3000", Map<String, String> headers, Map<String, dynamic> body}) async{
    try{
      final http.Response _res = await http.post(url)
          .timeout(Duration(seconds: 11), onTimeout: () => http.Response('null',404))
          .catchError((Object obj) => null, test: (Object error) => false);
      return json.decode(_res.body);
    }
    catch(e){
      return null;
    }
  }
}