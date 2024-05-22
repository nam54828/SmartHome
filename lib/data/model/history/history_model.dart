class HistoryModel {
  int? count;
  List<Data>? data;

  HistoryModel({this.count, this.data});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? hcategory;
  String? hname;
  bool? hstatus;
  String? hnotification;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.hcategory,
        this.hname,
        this.hstatus,
        this.hnotification,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    hcategory = json['hcategory'];
    hname = json['hname'];
    hstatus = json['hstatus'];
    hnotification = json['hnotification'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['hcategory'] = hcategory;
    data['hname'] = hname;
    data['hstatus'] = hstatus;
    data['hnotification'] = hnotification;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
