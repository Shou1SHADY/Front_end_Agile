class MaterialTa7dir {
  String? sId;
  String? title;
  String? imageUrl;
  int? quantity;
  int? iV;

  MaterialTa7dir({this.sId, this.title, this.imageUrl, this.quantity, this.iV});

  MaterialTa7dir.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    imageUrl = json['imageUrl'];
    quantity = json['quantity'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    data['quantity'] = this.quantity;
    data['__v'] = this.iV;
    return data;
  }
}
