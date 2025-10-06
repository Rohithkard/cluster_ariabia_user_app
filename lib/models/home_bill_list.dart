
class HomeBillList {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  HomeBillList({this.success, this.message, this.instance, this.data});

  HomeBillList.fromJson(Map<String, dynamic> json) {
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

  static List<HomeBillList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HomeBillList.fromJson(map)).toList();
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
  List<DataList>? dataList;
  int? perPageCount;

  Data({this.dataList, this.perPageCount});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["dataList"] is List) {
      dataList = json["dataList"] == null ? null : (json["dataList"] as List).map((e) => DataList.fromJson(e)).toList();
    }
    if(json["per_page_count"] is int) {
      perPageCount = json["per_page_count"];
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(dataList != null) {
      _data["dataList"] = dataList?.map((e) => e.toJson()).toList();
    }
    _data["per_page_count"] = perPageCount;
    return _data;
  }
}

class DataList {
  String? id;
  dynamic title;
  dynamic description;
  dynamic couponCode;
  dynamic couponDescription;
  dynamic couponValue;
  int? amount;
  int? taxAmount;
  int? tax;
  String? creditType;
  String? financeType;
  String? paymentMode;
  dynamic paidOn;
  String? billedOn;
  dynamic businessName;
  dynamic companyPhone;
  dynamic address;
  String? createdAt;
  String? updatedAt;
  String? img;
  School? school;
  TotalBillAmountData? totalBillAmountData;
  Student? student;

  DataList({this.id, this.title, this.description, this.couponCode, this.couponDescription, this.couponValue, this.amount, this.taxAmount, this.tax, this.creditType, this.financeType, this.paymentMode, this.paidOn, this.billedOn, this.businessName, this.companyPhone, this.address, this.createdAt, this.updatedAt, this.img, this.school, this.totalBillAmountData, this.student});

  DataList.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    title = json["title"];
    description = json["description"];
    couponCode = json["coupon_code"];
    couponDescription = json["coupon_description"];
    couponValue = json["coupon_value"];
    if(json["amount"] is int) {
      amount = json["amount"];
    }
    if(json["tax_amount"] is int) {
      taxAmount = json["tax_amount"];
    }
    if(json["tax"] is int) {
      tax = json["tax"];
    }
    if(json["credit_type"] is String) {
      creditType = json["credit_type"];
    }
    if(json["finance_type"] is String) {
      financeType = json["finance_type"];
    }
    if(json["payment_mode"] is String) {
      paymentMode = json["payment_mode"];
    }
    paidOn = json["paid_on"];
    if(json["billed_on"] is String) {
      billedOn = json["billed_on"];
    }
    businessName = json["business_name"];
    companyPhone = json["company_phone"];
    address = json["address"];
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["img"] is String) {
      img = json["img"];
    }
    if(json["school"] is Map) {
      school = json["school"] == null ? null : School.fromJson(json["school"]);
    }
    if(json["total_bill_amount_data"] is Map) {
      totalBillAmountData = json["total_bill_amount_data"] == null ? null : TotalBillAmountData.fromJson(json["total_bill_amount_data"]);
    }
    if(json["student"] is Map) {
      student = json["student"] == null ? null : Student.fromJson(json["student"]);
    }
  }

  static List<DataList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataList.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["description"] = description;
    _data["coupon_code"] = couponCode;
    _data["coupon_description"] = couponDescription;
    _data["coupon_value"] = couponValue;
    _data["amount"] = amount;
    _data["tax_amount"] = taxAmount;
    _data["tax"] = tax;
    _data["credit_type"] = creditType;
    _data["finance_type"] = financeType;
    _data["payment_mode"] = paymentMode;
    _data["paid_on"] = paidOn;
    _data["billed_on"] = billedOn;
    _data["business_name"] = businessName;
    _data["company_phone"] = companyPhone;
    _data["address"] = address;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["img"] = img;
    if(school != null) {
      _data["school"] = school?.toJson();
    }
    if(totalBillAmountData != null) {
      _data["total_bill_amount_data"] = totalBillAmountData?.toJson();
    }
    if(student != null) {
      _data["student"] = student?.toJson();
    }
    return _data;
  }
}

class Student {
  String? id;
  String? std;
  String? name;
  String? gender;
  int? status;
  String? division;
  String? createdAt;
  String? updatedAt;
  BusInRoute? busInRoute;

  Student({this.id, this.std, this.name, this.gender, this.status, this.division, this.createdAt, this.updatedAt, this.busInRoute});

  Student.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["std"] is String) {
      std = json["std"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["gender"] is String) {
      gender = json["gender"];
    }
    if(json["status"] is int) {
      status = json["status"];
    }
    if(json["division"] is String) {
      division = json["division"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["bus_in_route"] is Map) {
      busInRoute = json["bus_in_route"] == null ? null : BusInRoute.fromJson(json["bus_in_route"]);
    }
  }

  static List<Student> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Student.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["std"] = std;
    _data["name"] = name;
    _data["gender"] = gender;
    _data["status"] = status;
    _data["division"] = division;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    if(busInRoute != null) {
      _data["bus_in_route"] = busInRoute?.toJson();
    }
    return _data;
  }
}

class BusInRoute {
  BusInfo? busInfo;
  RouteInfo? routeInfo;
  String? busRouteId;

  BusInRoute({this.busInfo, this.routeInfo, this.busRouteId});

  BusInRoute.fromJson(Map<String, dynamic> json) {
    if(json["bus_info"] is Map) {
      busInfo = json["bus_info"] == null ? null : BusInfo.fromJson(json["bus_info"]);
    }
    if(json["route_info"] is Map) {
      routeInfo = json["route_info"] == null ? null : RouteInfo.fromJson(json["route_info"]);
    }
    if(json["bus_route_id"] is String) {
      busRouteId = json["bus_route_id"];
    }
  }

  static List<BusInRoute> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BusInRoute.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(busInfo != null) {
      _data["bus_info"] = busInfo?.toJson();
    }
    if(routeInfo != null) {
      _data["route_info"] = routeInfo?.toJson();
    }
    _data["bus_route_id"] = busRouteId;
    return _data;
  }
}

class RouteInfo {
  String? id;
  String? gender;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? isTwoWay;
  String? routeName;
  String? endingPoint;
  int? fareForRoute;
  String? startingPoint;
  int? endingLatitude;
  int? endingLongitude;
  int? startingLatitude;
  int? startingLongitude;
  String? morningStartingTime;
  String? afternoonStartingTime;

  RouteInfo({this.id, this.gender, this.status, this.createdAt, this.updatedAt, this.isTwoWay, this.routeName, this.endingPoint, this.fareForRoute, this.startingPoint, this.endingLatitude, this.endingLongitude, this.startingLatitude, this.startingLongitude, this.morningStartingTime, this.afternoonStartingTime});

  RouteInfo.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["gender"] is String) {
      gender = json["gender"];
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
    if(json["is_two_way"] is int) {
      isTwoWay = json["is_two_way"];
    }
    if(json["route_name"] is String) {
      routeName = json["route_name"];
    }
    if(json["ending_point"] is String) {
      endingPoint = json["ending_point"];
    }
    if(json["fare_for_route"] is int) {
      fareForRoute = json["fare_for_route"];
    }
    if(json["starting_point"] is String) {
      startingPoint = json["starting_point"];
    }
    if(json["ending_latitude"] is int) {
      endingLatitude = json["ending_latitude"];
    }
    if(json["ending_longitude"] is int) {
      endingLongitude = json["ending_longitude"];
    }
    if(json["starting_latitude"] is int) {
      startingLatitude = json["starting_latitude"];
    }
    if(json["starting_longitude"] is int) {
      startingLongitude = json["starting_longitude"];
    }
    if(json["morning_starting_time"] is String) {
      morningStartingTime = json["morning_starting_time"];
    }
    if(json["afternoon_starting_time"] is String) {
      afternoonStartingTime = json["afternoon_starting_time"];
    }
  }

  static List<RouteInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => RouteInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["gender"] = gender;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["is_two_way"] = isTwoWay;
    _data["route_name"] = routeName;
    _data["ending_point"] = endingPoint;
    _data["fare_for_route"] = fareForRoute;
    _data["starting_point"] = startingPoint;
    _data["ending_latitude"] = endingLatitude;
    _data["ending_longitude"] = endingLongitude;
    _data["starting_latitude"] = startingLatitude;
    _data["starting_longitude"] = startingLongitude;
    _data["morning_starting_time"] = morningStartingTime;
    _data["afternoon_starting_time"] = afternoonStartingTime;
    return _data;
  }
}

class BusInfo {
  String? id;
  String? busNo;
  String? gpsId;
  String? busModel;
  String? driverName;
  String? driverPhone;
  int? studentCapacity;

  BusInfo({this.id, this.busNo, this.gpsId, this.busModel, this.driverName, this.driverPhone, this.studentCapacity});

  BusInfo.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["bus_no"] is String) {
      busNo = json["bus_no"];
    }
    if(json["gps_id"] is String) {
      gpsId = json["gps_id"];
    }
    if(json["bus_model"] is String) {
      busModel = json["bus_model"];
    }
    if(json["driver_name"] is String) {
      driverName = json["driver_name"];
    }
    if(json["driver_phone"] is String) {
      driverPhone = json["driver_phone"];
    }
    if(json["student_capacity"] is int) {
      studentCapacity = json["student_capacity"];
    }
  }

  static List<BusInfo> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BusInfo.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["bus_no"] = busNo;
    _data["gps_id"] = gpsId;
    _data["bus_model"] = busModel;
    _data["driver_name"] = driverName;
    _data["driver_phone"] = driverPhone;
    _data["student_capacity"] = studentCapacity;
    return _data;
  }
}

class TotalBillAmountData {
  String? id;
  int? tax;
  int? amount;
  dynamic couponVal;
  dynamic couponCode;
  int? taxPercentage;

  TotalBillAmountData({this.id, this.tax, this.amount, this.couponVal, this.couponCode, this.taxPercentage});

  TotalBillAmountData.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["tax"] is int) {
      tax = json["tax"];
    }
    if(json["amount"] is int) {
      amount = json["amount"];
    }
    couponVal = json["coupon_val"];
    couponCode = json["coupon_code"];
    if(json["tax_percentage"] is int) {
      taxPercentage = json["tax_percentage"];
    }
  }

  static List<TotalBillAmountData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TotalBillAmountData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["tax"] = tax;
    _data["amount"] = amount;
    _data["coupon_val"] = couponVal;
    _data["coupon_code"] = couponCode;
    _data["tax_percentage"] = taxPercentage;
    return _data;
  }
}

class School {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  int? studentCapacity;

  School({this.id, this.name, this.email, this.phone, this.address, this.studentCapacity});

  School.fromJson(Map<String, dynamic> json) {
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
    if(json["student_capacity"] is int) {
      studentCapacity = json["student_capacity"];
    }
  }

  static List<School> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => School.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["address"] = address;
    _data["student_capacity"] = studentCapacity;
    return _data;
  }
}