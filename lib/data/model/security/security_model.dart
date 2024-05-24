class SecurityModel {
  int? count;
  List<Data>? data;

  SecurityModel({this.count, this.data});

  SecurityModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? topic;
  bool? notification;
  String? password;
  String? primaryPassword;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data(
      {this.sId,
        this.name,
        this.topic,
        this.notification,
        this.password,
        this.primaryPassword,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    topic = json['topic'];
    notification = json['notification'];
    password = json['password'];
    primaryPassword = json['primaryPassword'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['topic'] = topic;
    data['notification'] = notification;
    data['password'] = password;
    data['primaryPassword'] = primaryPassword;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}