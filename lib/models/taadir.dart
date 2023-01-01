import 'package:localization/models/taadir_detail.dart';
import 'package:localization/models/user.dart';

import 'Login_response.dart';

class Ta7dir {
  String? sId;
  PreparationDetails? preparationDetails;
  Chef? chef;
  int? iV;

  Ta7dir({this.sId, this.preparationDetails, this.chef, this.iV});

  Ta7dir.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    preparationDetails = json['preparation_details'] != null
        ? new PreparationDetails.fromJson(json['preparation_details'])
        : null;
    chef = json['chef'] != null ? new Chef.fromJson(json['chef']) : null;
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.preparationDetails != null) {
      data['preparation_details'] = this.preparationDetails!.toJson();
    }
    if (this.chef != null) {
      data['chef'] = this.chef!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}
