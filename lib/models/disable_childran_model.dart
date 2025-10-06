
class DisableChildModel {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  DisableChildModel({this.success, this.message, this.instance, this.data});

  DisableChildModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
    instance = json["instance"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
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
  Parent? parent;
  Student? student;
  String? reason;
  String? serviceEndRequested;
  bool? attended;
  String? id;
  String? createdAt;
  String? updatedAt;

  Data({this.parent, this.student, this.reason, this.serviceEndRequested, this.attended, this.id, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    parent = json["parent"] == null ? null : Parent.fromJson(json["parent"]);
    student = json["student"] == null ? null : Student.fromJson(json["student"]);
    reason = json["reason"];
    serviceEndRequested = json["service_end_requested"];
    attended = json["attended"];
    id = json["id"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(parent != null) {
      _data["parent"] = parent?.toJson();
    }
    if(student != null) {
      _data["student"] = student?.toJson();
    }
    _data["reason"] = reason;
    _data["service_end_requested"] = serviceEndRequested;
    _data["attended"] = attended;
    _data["id"] = id;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}

class Student {
  String? id;
  String? studentName;
  String? admissionNo;
  String? gender;
  String? parentType;
  String? country;
  String? state;
  String? img;
  String? std;
  String? division;
  dynamic serviceStartedOn;
  dynamic serviceEndedOn;
  dynamic cancellationReason;
  String? address;
  bool? status;
  String? location;
  String? createdAt;
  String? updatedAt;

  Student({this.id, this.studentName, this.admissionNo, this.gender, this.parentType, this.country, this.state, this.img, this.std, this.division, this.serviceStartedOn, this.serviceEndedOn, this.cancellationReason, this.address, this.status, this.location, this.createdAt, this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    studentName = json["student_name"];
    admissionNo = json["admission_no"];
    gender = json["gender"];
    parentType = json["parent_type"];
    country = json["country"];
    state = json["state"];
    img = json["img"];
    std = json["std"];
    division = json["division"];
    serviceStartedOn = json["service_started_on"];
    serviceEndedOn = json["service_ended_on"];
    cancellationReason = json["cancellation_reason"];
    address = json["address"];
    status = json["status"];
    location = json["location"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["student_name"] = studentName;
    _data["admission_no"] = admissionNo;
    _data["gender"] = gender;
    _data["parent_type"] = parentType;
    _data["country"] = country;
    _data["state"] = state;
    _data["img"] = img;
    _data["std"] = std;
    _data["division"] = division;
    _data["service_started_on"] = serviceStartedOn;
    _data["service_ended_on"] = serviceEndedOn;
    _data["cancellation_reason"] = cancellationReason;
    _data["address"] = address;
    _data["status"] = status;
    _data["location"] = location;
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
  String? location;
  String? otp;
  String? token;
  String? createdAt;
  String? updatedAt;

  Parent({this.id, this.parentName, this.email, this.img, this.parentPhone, this.address, this.status, this.location, this.otp, this.token, this.createdAt, this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    parentName = json["parent_name"];
    email = json["email"];
    img = json["img"];
    parentPhone = json["parent_phone"];
    address = json["address"];
    status = json["status"];
    location = json["location"];
    otp = json["otp"];
    token = json["token"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
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
    _data["location"] = location;
    _data["otp"] = otp;
    _data["token"] = token;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    return _data;
  }
}