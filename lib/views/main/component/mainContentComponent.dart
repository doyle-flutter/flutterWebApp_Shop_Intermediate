import 'package:flutter/material.dart';
import 'package:myshop/models/viewDataModel.dart';

class MainContentComponent extends StatelessWidget {
  final int crossAxisCount;
  final int ea;
  final List<ViewDataModel> data;
  const MainContentComponent({@required this.crossAxisCount, @required this.ea, @required this.data})
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
      onTap: () => Navigator.of(context).pushNamed('/detailPage/${this.data[index].pid}'),
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: NetworkImage(this.data[index].img),
              fit: BoxFit.cover
            )
          ),
        ),
        footer: Container(
          padding: EdgeInsets.all(10.0),
          color: Colors.grey[600],
          child: Text(
            this.data[index].title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22.0
            ),
          ),
        ),
      ),
    )
  );
}
