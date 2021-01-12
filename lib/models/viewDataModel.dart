class ViewDataModel{
  final String id;
  final String pid;
  final String img;
  final String title;
  final String category;
  final String scategory;
  final String des;
  final String price;
  const ViewDataModel({
    this.id,
    this.pid,
    this.title,
    this.img,
    this.des,
    this.price,
    this.category,
    this.scategory,
  });
  factory ViewDataModel.fromJson(dynamic json) => ViewDataModel(
    id: json['id'].toString(),
    pid: json['pid'].toString(),
    title: json['title'].toString(),
    img: json['img'].toString(),
    price: json['price'].toString(),
    category: json['category'].toString(),
    scategory: json['scategory'].toString(),
    des: json['des'].toString(),
  );
}