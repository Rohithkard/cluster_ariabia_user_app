
class CouponModel {
    bool? success;
    String? message;
    String? instance;
    Data? data;

    CouponModel({this.success, this.message, this.instance, this.data});

    CouponModel.fromJson(Map<String, dynamic> json) {
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

    static List<CouponModel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => CouponModel.fromJson(map)).toList();
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
    String? error;
    String? couponCode;
    String? startDate;
    String? endDate;
    int? value;
    int? limit;
    String? description;
    int? noMinimumChildren;
    int? status;
    String? createdAt;
    String? updatedAt;

    Data({this.id, this.error, this.couponCode, this.startDate, this.endDate, this.value, this.limit, this.description, this.noMinimumChildren, this.status, this.createdAt, this.updatedAt});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["id"] is String) {
            id = json["id"];
        }
        if(json["error"] is String) {
            error = json["error"];
        }
        if(json["coupon_code"] is String) {
            couponCode = json["coupon_code"];
        }
        if(json["start_date"] is String) {
            startDate = json["start_date"];
        }
        if(json["end_date"] is String) {
            endDate = json["end_date"];
        }
        if(json["value"] is int) {
            value = json["value"];
        }
        if(json["limit"] is int) {
            limit = json["limit"];
        }
        if(json["description"] is String) {
            description = json["description"];
        }
        if(json["no_minimum_children"] is int) {
            noMinimumChildren = json["no_minimum_children"];
        }
        if(json["status"] is int) {
            status = json["status"];
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
        _data["id"] = id;
        _data["error"] = error;
        _data["coupon_code"] = couponCode;
        _data["start_date"] = startDate;
        _data["end_date"] = endDate;
        _data["value"] = value;
        _data["limit"] = limit;
        _data["description"] = description;
        _data["no_minimum_children"] = noMinimumChildren;
        _data["status"] = status;
        _data["createdAt"] = createdAt;
        _data["updatedAt"] = updatedAt;
        return _data;
    }
}