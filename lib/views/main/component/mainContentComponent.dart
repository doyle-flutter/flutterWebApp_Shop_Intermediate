import 'package:flutter/material.dart';

class MainContentComponent extends StatelessWidget {
  final int crossAxisCount;
  final int ea;
  const MainContentComponent({@required this.crossAxisCount, @required this.ea})
    : assert(ea != null), assert(crossAxisCount != null);

  @override
  Widget build(BuildContext context) => GridView.builder(
    padding: EdgeInsets.all(10.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: this.crossAxisCount,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0
    ),
    controller: ScrollController(),
    itemCount: this.ea,
    itemBuilder: (BuildContext context, int index) => GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/detailPage'),
      child: GridTile(
        child: Container(
          color: Colors.red,
          child: Center(
            child: Text(
              index.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22.0
              ),
            ),
          )
        ),
      ),
    )
  );
}
