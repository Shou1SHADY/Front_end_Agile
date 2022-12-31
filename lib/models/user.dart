import 'package:localization/models/taadir.dart';

class User {
  bool? acceptance;
  int? groupNumber;
  String? type;
  String? name;
  String? avatar;
  String? id;
  User(
      {this.type,
      this.name,
      this.avatar,
      this.id,
      this.groupNumber,
      this.acceptance});
}
