import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myshop/providers/mainProvider.dart';
import 'package:myshop/repos/socket.dart';
import 'package:myshop/views/commonComponent/menuComponent.dart';
import 'package:myshop/views/detail/detailPage.dart';
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
          List<Map<String, String>> menuData = [{'name':'home'}, {'name':'category'}];
          if(settings.name == '/test'){
            return MaterialPageRoute(
              settings: RouteSettings(name: '/test'),
              maintainState: false,
              builder: (BuildContext context) => MainPage()
            );
          }
          if(settings.name == '/category'){
            return MaterialPageRoute(
              settings: RouteSettings(name: '/category'),
              maintainState: false,
              builder: (BuildContext context) => Scaffold(
                appBar: AppBar(
                  title: Text("category"),
                  leading: Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ),
                endDrawer: Drawer(
                  child: MenuComponent(menuData: menuData,),
                ),
              )
            );
          }
          if(settings.name == '/detailPage'){
            return MaterialPageRoute(
                settings: RouteSettings(name: '/detailPage'),
                maintainState: false,
                builder: (BuildContext context) => DetailPage(
                  title: "Flutter Detail",
                  menuData: menuData
                )
            );
          }
          return MaterialPageRoute(
            settings: RouteSettings(name: '/'),
            maintainState: false,
            builder: (BuildContext context) => MainPage2(menuData: menuData,)
          );
        },
      ),
    )
  );
}