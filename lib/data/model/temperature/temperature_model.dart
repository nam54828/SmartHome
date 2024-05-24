class TempModel {
  int? count;
  List<Data>? data;

  TempModel({this.count, this.data});

  TempModel.fromJson(Map<String, dynamic> json) {
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
  String? topictemp;
  String? statustemp;
  String? notificationtemp;
  String? topichumi;
  String? statushumi;
  String? notificationhumi;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.topictemp,
        this.statustemp,
        this.notificationtemp,
        this.topichumi,
        this.statushumi,
        this.notificationhumi,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    topictemp = json['topictemp'];
    statustemp = json['statustemp'];
    notificationtemp = json['notificationtemp'];
    topichumi = json['topichumi'];
    statushumi = json['statushumi'];
    notificationhumi = json['notificationhumi'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['topictemp'] = topictemp;
    data['statustemp'] = statustemp;
    data['notificationtemp'] = notificationtemp;
    data['topichumi'] = topichumi;
    data['statushumi'] = statushumi;
    data['notificationhumi'] = notificationhumi;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
