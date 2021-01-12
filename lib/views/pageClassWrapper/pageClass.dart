import 'package:flutter/material.dart';
import 'package:myshop/views/wrappers/reactWrapper.dart';

abstract class PageClass extends StatelessWidget {
  const PageClass();
  @override
  Widget build(BuildContext context) => _render();

  Widget _render() => ReactWrapper(webScaffold: this.webScaffold, appScaffold: this.appScaffold);
  Widget webScaffold(BuildContext context);
  Widget appScaffold(BuildContext context);
}