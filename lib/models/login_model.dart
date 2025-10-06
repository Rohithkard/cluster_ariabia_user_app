class LoginModel {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  LoginModel({this.success, this.message, this.instance, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? mobileOrEmail;
  String? otp;
  String? otpToken;

  Data({this.mobileOrEmail, this.otp, this.otpToken});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["mobile_or_email"] is String) {
      mobileOrEmail = json["mobile_or_email"];
    }
    if(json["otp"] is String) {
      otp = json["otp"];
    }
    if(json["otp_token"] is String) {
      otpToken = json["otp_token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["mobile_or_email"] = mobileOrEmail;
    _data["otp"] = otp;
    _data["otp_token"] = otpToken;
    return _data;
  }
}