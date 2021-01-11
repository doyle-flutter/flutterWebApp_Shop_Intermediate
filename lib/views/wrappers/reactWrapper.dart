import 'package:flutter/material.dart';

class ReactBaseSize {
  double _standardSize = 800.0;
  bool _isWebCheck() => identical(0, 0.0);
}

// ignore: must_be_immutable
class ReactWrapper extends StatelessWidget with ReactBaseSize{
  final WidgetBuilder webScaffold;
  final WidgetBuilder appScaffold;
  final Widget test;
  ReactWrapper({@required this.webScaffold, @required this.appScaffold, this.test});

  @override
  Widget build(BuildContext context) => _widget(context);

  Widget _widget(BuildContext context){
    if(_isWebCheck() && MediaQuery.of(context).size.width > _standardSize) return webScaffold(context);
    return appScaffold(context);
  }
}