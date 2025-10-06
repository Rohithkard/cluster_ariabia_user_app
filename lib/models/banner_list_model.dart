
class BannerListModel {
  bool? success;
  String? message;
  String? instance;
  List<Data>? data;

  BannerListModel({this.success, this.message, this.instance, this.data});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["instance"] is String) {
      instance = json["instance"];
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["instance"] = instance;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  String? id;
  String? type;
  String? img;

  Data({this.id, this.type, this.img});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["img"] is String) {
      img = json["img"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["type"] = type;
    _data["img"] = img;
    return _data;
  }
}