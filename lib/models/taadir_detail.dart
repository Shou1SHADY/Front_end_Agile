import 'taadir_materials.dart';

class PreparationDetails {
  String? sId;
  List<MaterialTa7dir>? materiels;
  String? subject;
  String? meal;
  int? money;
  int? iV;

  PreparationDetails(
      {this.sId, this.materiels, this.subject, this.meal, this.money, this.iV});

  PreparationDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['materiels'] != null) {
      materiels = <MaterialTa7dir>[];
      json['materiels'].forEach((v) {
        materiels!.add(new MaterialTa7dir.fromJson(v));
      });
    }
    subject = json['subject'];
    meal = json['meal'];
    money = json['money'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.materiels != null) {
      data['materiels'] = this.materiels!.map((v) => v.toJson()).toList();
    }
    data['subject'] = this.subject;
    data['meal'] = this.meal;
    data['money'] = this.money;
    data['__v'] = this.iV;
    return data;
  }
}
