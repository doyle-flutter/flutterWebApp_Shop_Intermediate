import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myshop/providers/mainProvider.dart';
import 'package:myshop/repos/socket.dart';
import 'package:myshop/views/main/mainPage.dart';
import 'package:myshop/views/main/mainPage2.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider()),
        ChangeNotifierProvider<SocketConnect>(create: (_) => SocketConnect()),
      ],
      child: MaterialApp(
        // home: MainPage2(),
        onGenerateRoute: (RouteSettings settings){
          if(settings.name == '/test'){
            return MaterialPageRoute(
              settings: RouteSettings(name: '/'),
              maintainState: false,
              builder: (BuildContext context) => MainPage()
            );
          }
          return MaterialPageRoute(
              settings: RouteSettings(name: '/'),
              maintainState: false,
              builder: (BuildContext context) => MainPage2()
          );
        },
      ),
    )
  );
}