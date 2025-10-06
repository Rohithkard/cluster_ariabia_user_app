
class CouponModelList {
    bool? success;
    String? message;
    String? instance;
    Data? data;

    CouponModelList({this.success, this.message, this.instance, this.data});

    CouponModelList.fromJson(Map<String, dynamic> json) {
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

    static List<CouponModelList> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => CouponModelList.fromJson(map)).toList();
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
    List<Coupons>? coupons;
    int? perPageCount;
    int? totalCount;

    Data({this.coupons, this.perPageCount, this.totalCount});

    Data.fromJson(Map<String, dynamic> json) {
        if(json["coupons"] is List) {
            coupons = json["coupons"] == null ? null : (json["coupons"] as List).map((e) => Coupons.fromJson(e)).toList();
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
        if(coupons != null) {
            _data["coupons"] = coupons?.map((e) => e.toJson()).toList();
        }
        _data["per_page_count"] = perPageCount;
        _data["total_count"] = totalCount;
        return _data;
    }
}

class Coupons {
    String? id;
    String? couponCode;
    String? startDate;
    String? endDate;
    int? value;
    int? limit;
    String? description;
    int? noMinimumChildren;
    int? status;
    int? visibleToAll;
    String? createdAt;
    String? updatedAt;
    bool? isCouponUsed;

    Coupons({this.id, this.couponCode, this.startDate, this.endDate, this.value, this.limit, this.description, this.noMinimumChildren, this.status, this.visibleToAll, this.createdAt, this.updatedAt, this.isCouponUsed});

    Coupons.fromJson(Map<String, dynamic> json) {
        if(json["id"] is String) {
            id = json["id"];
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
        if(json["visible_to_all"] is int) {
            visibleToAll = json["visible_to_all"];
        }
        if(json["createdAt"] is String) {
            createdAt = json["createdAt"];
        }
        if(json["updatedAt"] is String) {
            updatedAt = json["updatedAt"];
        }
        if(json["isCouponUsed"] is bool) {
            isCouponUsed = json["isCouponUsed"];
        }
    }

    static List<Coupons> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Coupons.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["coupon_code"] = couponCode;
        _data["start_date"] = startDate;
        _data["end_date"] = endDate;
        _data["value"] = value;
        _data["limit"] = limit;
        _data["description"] = description;
        _data["no_minimum_children"] = noMinimumChildren;
        _data["status"] = status;
        _data["visible_to_all"] = visibleToAll;
        _data["createdAt"] = createdAt;
        _data["updatedAt"] = updatedAt;
        _data["isCouponUsed"] = isCouponUsed;
        return _data;
    }
}