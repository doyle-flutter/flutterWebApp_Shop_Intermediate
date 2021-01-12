import 'package:socket_io_client/socket_io_client.dart';
import 'package:flutter/foundation.dart';

class SocketConnect with ChangeNotifier{
  final String url;
  Socket socket;
  SocketConnect({this.url = 'http://192.168.0.3:3000/'}){
    this._init();
  }
  void _init(){
    if(this.socket == null){
      try{
        this.socket = io(url, OptionBuilder().setTransports(['websocket']).build())
          .connect();
      }
      catch(e){
        this.socket = null;
      }
    }
    return;
  }
}