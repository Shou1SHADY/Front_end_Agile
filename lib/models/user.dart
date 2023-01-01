import 'package:localization/models/taadir.dart';

class Chef {
  String? sId;
  String? name;
  String? email;
  String? password;
  String? userType;
  String? date;
  int? iV;

  Chef(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.userType,
      this.date,
      this.iV});

  Chef.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    userType = json['userType'];
    date = json['date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['userType'] = this.userType;
    data['date'] = this.date;
    data['__v'] = this.iV;
    return data;
  }
}
