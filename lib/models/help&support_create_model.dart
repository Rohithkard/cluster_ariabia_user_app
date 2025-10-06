
class HelpAndSupportCreateModel {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  HelpAndSupportCreateModel({this.success, this.message, this.instance, this.data});

  HelpAndSupportCreateModel.fromJson(Map<String, dynamic> json) {
    if(json["success"] is bool) {
      success = json["success"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["instance"] is String) {
      instance = json["instance"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<HelpAndSupportCreateModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HelpAndSupportCreateModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["instance"] = instance;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? content;
  String? subject;
  Parent? parent;
  dynamic replay;
  String? id;
  String? createdAt;
  String? updatedAt;

  Data({this.content, this.subject, this.parent, this.replay, this.id, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["content"] is String) {
      content = json["content"];
    }
    if(json["subject"] is String) {
      subject = json["subject"];
    }
    if(json["parent"] is Map) {
      parent = json["parent"] == null ? null : Parent.fromJson(json["parent"]);
    }
    replay = json["replay"];
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["content"] = content;
    _data["subject"] = subject;
    if(parent != null) {
      _data["parent"] = parent?.toJson();
    }
    _data["replay"] = replay;
    _data["id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class Parent {
  String? id;
  String? parentName;
  String? email;
  dynamic img;
  String? parentPhone;
  String? address;
  bool? status;
  String? createdAt;
  String? updatedAt;

  Parent({this.id, this.parentName, this.email, this.img, this.parentPhone, this.address, this.status, this.createdAt, this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["parent_name"] is String) {
      parentName = json["parent_name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    img = json["img"];
    if(json["parent_phone"] is String) {
      parentPhone = json["parent_phone"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
  }

  static List<Parent> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Parent.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["parent_name"] = parentName;
    _data["email"] = email;
    _data["img"] = img;
    _data["parent_phone"] = parentPhone;
    _data["address"] = address;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}