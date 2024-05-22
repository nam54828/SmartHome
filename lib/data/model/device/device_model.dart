class Category {
  String name;
  String topic;
  bool status;
  String color;
  String voice;
  bool notification;
  String time;
  String icon;

  Category({
    required this.name,
    required this.topic,
    required this.status,
    required this.color,
    required this.voice,
    required this.notification,
    required this.time,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      topic: json['topic'],
      status: json['status'],
      color: json['color'],
      voice: json['voice'],
      notification: json['notification'],
      time: json['time'],
      icon: json['icon'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'topic': topic,
      'status': status,
      'color': color,
      'voice': voice,
      'notification': notification,
      'time': time,
      'icon': icon,
    };
  }

}

class Data {
  Category category;
  String? id;
  String? createdAt;
  String? updatedAt;
  int? v;
  String colorcategory;
  String namecategory;

  Data({
    required this.category,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
    required this.colorcategory,
    required this.namecategory,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      category: Category.fromJson(json['category'] ?? {}),
      id: json['_id'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt']  ?? '',
      v: json['__v'] ?? '',
      colorcategory: json['colorcategory'] ?? '',
      namecategory: json['namecategory'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'category': category.toJson(),
      'colorcategory': colorcategory,
      'namecategory': namecategory,
    };
  }


}

class DeviceModel {
  int? count;
  List<Data> data;

  DeviceModel({
    this.count,
    required this.data,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List? ?? [];
    List<Data> data = dataList.map((e) => Data.fromJson(e)).toList();

    return DeviceModel(
      count: json['count'],
      data: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
