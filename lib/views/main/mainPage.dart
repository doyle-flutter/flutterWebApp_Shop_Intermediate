import 'package:flutter/material.dart';
import 'package:myshop/providers/mainProvider.dart';
import 'package:myshop/repos/socket.dart';
import 'package:myshop/views/main/component/mainContentComponent.dart';
import 'package:myshop/views/main/layout/mainWebLayout.dart';
import 'package:myshop/views/wrappers/reactWrapper.dart';
import 'package:provider/provider.dart';


// MainPage2 와 비교하기 위한 내용
class MainPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    MainProvider _mainProvider = Provider.of<MainProvider>(context);
    SocketConnect _soc = Provider.of<SocketConnect>(context);
    return ReactWrapper(webScaffold: _webScaffold, appScaffold: _appScaffold, test: test(context),);
  }

  Widget test(context){
    print("TesT WIDGET : ${context.widget}");
    return Scaffold(body: Center(child: Text("역전"),),);
  }
  // Widget _webScaffold(BuildContext context){
  //   print("WIDGET : ${context.widget}");
  //   return Scaffold(
  //     body: Center(child: TextButton(
  //       child: Text("역전"),
  //       onPressed: (){
  //         // Scaffold.of(context).
  //         SnackBar(content: Text("SNACK"),);
  //       },
  //     ),),
  //   );
  // }
  Widget _webScaffold(BuildContext context)
    => Scaffold(body: MainWebLayOut(menu: (BuildContext context) => Container(child: Center(child: Text("MENU"),),), mainContent: (BuildContext context) => MainContentComponent()));
  Widget _appScaffold(BuildContext context) => Scaffold(body: MainContentComponent());
}