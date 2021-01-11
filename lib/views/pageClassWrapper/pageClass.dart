import 'package:flutter/material.dart';
import 'package:myshop/views/wrappers/reactWrapper.dart';

abstract class PageClass extends StatelessWidget {
  const PageClass();
  Widget build(BuildContext context) => render();

  Widget render() => ReactWrapper(webScaffold: this.webScaffold, appScaffold: this.appScaffold);
  Widget webScaffold(BuildContext context);
  Widget appScaffold(BuildContext context);
}