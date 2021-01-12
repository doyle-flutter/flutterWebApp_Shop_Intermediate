import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myshop/providers/categoryProvider.dart';
import 'package:myshop/providers/detailProvider.dart';
import 'package:myshop/providers/mainProvider.dart';
import 'package:myshop/providers/menuProvider.dart';
import 'package:myshop/repos/socket.dart';
import 'package:myshop/views/category/categoryPage.dart';
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
        ChangeNotifierProvider<SocketConnect>(create: (_) => SocketConnect()),
        ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider()),
        ChangeNotifierProvider<MenuProvider>(create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        // home: MainPage2(),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings){
          List<Map<String, dynamic>> menuData = [
            {'name':'Home'},
            {
              'name':'Category',
              'menus': [
                "TOP",
                "Bottom",
                "Outer",
                "Onepice",
              ]
            }
          ];
          if(settings.name == '/'){
            return MaterialPageRoute(
              settings: RouteSettings(name: '/'),
              maintainState: false,
              builder: (BuildContext context) => MainPage2(menuData: menuData,)
            );
          }
          if(settings.name == '/test'){
            return MaterialPageRoute(
              settings: RouteSettings(name: '/test'),
              maintainState: false,
              builder: (BuildContext context) => MainPage()
            );
          }
          // if(settings.name == '/category'){
          //   return MaterialPageRoute(
          //     settings: RouteSettings(name: '/category'),
          //     maintainState: false,
          //     builder: (BuildContext context) => ChangeNotifierProvider(
          //       create: (_) => CategoryProvider(path: ''),
          //       child: CategoryPage()
          //     )
          //   );
          // }
          // if(settings.name == '/detailPage'){
          //   return MaterialPageRoute(
          //       settings: RouteSettings(name: '/detailPage'),
          //       maintainState: false,
          //       builder: (BuildContext context) => DetailPage(
          //         title: "Flutter Detail",
          //         menuData: menuData
          //       )
          //   );
          // }
          Uri _uri = Uri.parse(settings.name);
          if(_uri.pathSegments.first == 'detailPage'){
            if(_uri.pathSegments.length < 2 || _uri.pathSegments[1].toString() == '') return MaterialPageRoute(
                settings: RouteSettings(name: '/'),
                maintainState: false,
                builder: (BuildContext context) => MainPage2(menuData: menuData,)
            );
            return MaterialPageRoute(
              settings: RouteSettings(name: '/detailPage/${_uri.pathSegments[1].toString()}'),
              maintainState: false,
              builder: (BuildContext context) => ChangeNotifierProvider<DetailProvider>(
                create: (_) => DetailProvider(pid: _uri.pathSegments[1].toString()),
                child: DetailPage(
                  title: "Flutter Detail ${_uri.pathSegments[1].toString()}",
                  connCheck: true,
                  pid: _uri.pathSegments[1].toString(),
                  menuData: menuData
                ),
              )
            );
          }
          if(_uri.pathSegments.first == 'category'){
            if(_uri.pathSegments.length < 2 || _uri.pathSegments[1].toString() == '') return MaterialPageRoute(
                settings: RouteSettings(name: '/'),
                maintainState: false,
                builder: (BuildContext context) => MainPage2(menuData: menuData,)
            );
            final String _path = _uri.pathSegments[1].toString();
            return MaterialPageRoute(
                settings: RouteSettings(name: '/category/$_path'),
                maintainState: false,
                builder: (BuildContext context) => ChangeNotifierProvider(
                  create: (_) => CategoryProvider(path: _path),
                  child: CategoryPage()
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