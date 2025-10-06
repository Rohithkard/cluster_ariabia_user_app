
class HelpAndSupportModelList {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  HelpAndSupportModelList({this.success, this.message, this.instance, this.data});

  HelpAndSupportModelList.fromJson(Map<String, dynamic> json) {
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

  static List<HelpAndSupportModelList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HelpAndSupportModelList.fromJson(map)).toList();
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
  List<HelpAndSupportList>? helpAndSupportList;
  int? perPageCount;
  int? totalCount;

  Data({this.helpAndSupportList, this.perPageCount, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["help_and_support_list"] is List) {
      helpAndSupportList = json["help_and_support_list"] == null ? null : (json["help_and_support_list"] as List).map((e) => HelpAndSupportList.fromJson(e)).toList();
    }
    if(json["per_page_count"] is int) {
      perPageCount = json["per_page_count"];
    }
    if(json["total_count"] is int) {
      totalCount = json["total_count"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(helpAndSupportList != null) {
      _data["help_and_support_list"] = helpAndSupportList?.map((e) => e.toJson()).toList();
    }
    _data["per_page_count"] = perPageCount;
    _data["total_count"] = totalCount;
    return _data;
  }
}

class HelpAndSupportList {
  String? id;
  String? subject;
  String? content;
  dynamic replay;
  String? createdAt;
  String? updatedAt;
  Parent? parent;

  HelpAndSupportList({this.id, this.subject, this.content, this.replay, this.createdAt, this.updatedAt, this.parent});

  HelpAndSupportList.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["subject"] is String) {
      subject = json["subject"];
    }
    if(json["content"] is String) {
      content = json["content"];
    }
    replay = json["replay"];
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["parent"] is Map) {
      parent = json["parent"] == null ? null : Parent.fromJson(json["parent"]);
    }
  }

  static List<HelpAndSupportList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HelpAndSupportList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["subject"] = subject;
    _data["content"] = content;
    _data["replay"] = replay;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    if(parent != null) {
      _data["parent"] = parent?.toJson();
    }
    return _data;
  }
}

class Parent {
  String? id;
  String? img;
  String? email;
  int? status;
  String? updatedAt;
  String? parentName;
  String? parentPhone;

  Parent({this.id, this.img, this.email, this.status, this.updatedAt, this.parentName, this.parentPhone});

  Parent.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["img"] is String) {
      img = json["img"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["status"] is int) {
      status = json["status"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["parent_name"] is String) {
      parentName = json["parent_name"];
    }
    if(json["parent_phone"] is String) {
      parentPhone = json["parent_phone"];
    }
  }

  static List<Parent> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Parent.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["img"] = img;
    _data["email"] = email;
    _data["status"] = status;
    _data["updatedAt"] = updatedAt;
    _data["parent_name"] = parentName;
    _data["parent_phone"] = parentPhone;
    return _data;
  }
}