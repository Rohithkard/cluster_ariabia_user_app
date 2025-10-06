
class ProfileModel {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  ProfileModel({this.success, this.message, this.instance, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? latitude;
  int? longitude;
  String? img;
  String? students;

  Data({this.id, this.name, this.email, this.phone, this.address, this.status, this.createdAt, this.updatedAt, this.latitude, this.longitude, this.img, this.students});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["latitude"] is num) {
      latitude = (json["latitude"] as num).toInt();
    }
    if(json["longitude"] is num) {
      longitude = (json["longitude"] as num).toInt();
    }
    if(json["img"] is String) {
      img = json["img"];
    }
    if(json["students"] is String) {
      students = json["students"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["address"] = address;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["img"] = img;
    _data["students"] = students;
    return _data;
  }
}