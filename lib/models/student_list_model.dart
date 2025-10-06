
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

class StudentModelList {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  StudentModelList({this.success, this.message, this.instance, this.data});

  StudentModelList.fromJson(Map<String, dynamic> json) {
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

  static List<StudentModelList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => StudentModelList.fromJson(map)).toList();
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
  int? pagePerCount;
  int? totalCount;

  Data({this.dataList, this.pagePerCount, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["dataList"] is List) {
      dataList = json["dataList"] == null ? null : (json["dataList"] as List).map((e) => DataList.fromJson(e)).toList();
    }
    if(json["page_per_count"] is int) {
      pagePerCount = json["page_per_count"];
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
    if(dataList != null) {
      _data["dataList"] = dataList?.map((e) => e.toJson()).toList();
    }
    _data["page_per_count"] = pagePerCount;
    _data["total_count"] = totalCount;
    return _data;
  }
}

class DataList {
  String? id;
  String? studentName;
  String? admissionNo;
  String? gender;
  String? parentType;
  String? country;
  String? state;
  String? std;
  String? division;
  dynamic serviceStartedOn;
  dynamic serviceEndedOn;
  dynamic cancellationReason;
  String? address;
  bool? status;
  String? createdAt;
  String? updatedAt;
  String? img;
  double? studentLatitude;
  double? studentLongitude;
  School? school;
  PickUp? pickUp;
  BusInRoute? busInRoute;

  DataList({this.id, this.studentName, this.admissionNo, this.gender, this.parentType, this.country, this.state, this.std, this.division, this.serviceStartedOn, this.serviceEndedOn, this.cancellationReason, this.address, this.status, this.createdAt, this.updatedAt, this.img, this.studentLatitude, this.studentLongitude, this.school, this.pickUp, this.busInRoute});

  DataList.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["student_name"] is String) {
      studentName = json["student_name"];
    }
    if(json["admission_no"] is String) {
      admissionNo = json["admission_no"];
    }
    if(json["gender"] is String) {
      gender = json["gender"];
    }
    if(json["parent_type"] is String) {
      parentType = json["parent_type"];
    }
    if(json["country"] is String) {
      country = json["country"];
    }
    if(json["state"] is String) {
      state = json["state"];
    }
    if(json["std"] is String) {
      std = json["std"];
    }
    if(json["division"] is String) {
      division = json["division"];
    }
    serviceStartedOn = json["service_started_on"];
    serviceEndedOn = json["service_ended_on"];
    cancellationReason = json["cancellation_reason"];
    if(json["address"] is String) {
      address = json["address"];
    }
    // if(json["status"] is int) {
      status = json["status"].toString().cToBoolean;
    // }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["img"] is String) {
      img = json["img"];
    }
    if(json["student_latitude"] is double) {
      studentLatitude = json["student_latitude"];
    }
    if(json["student_longitude"] is double) {
      studentLongitude = json["student_longitude"];
    }
    if(json["school"] is Map) {
      school = json["school"] == null ? null : School.fromJson(json["school"]);
    }
    if(json["pick_up"] is Map) {
      pickUp = json["pick_up"] == null ? null : PickUp.fromJson(json["pick_up"]);
    }
    if(json["bus_in_route"] is Map) {
      busInRoute = json["bus_in_route"] == null ? null : BusInRoute.fromJson(json["bus_in_route"]);
    }
  }

  static List<DataList> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DataList.fromJson(map)).toList();
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
    _data["std"] = std;
    _data["division"] = division;
    _data["service_started_on"] = serviceStartedOn;
    _data["service_ended_on"] = serviceEndedOn;
    _data["cancellation_reason"] = cancellationReason;
    _data["address"] = address;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["img"] = img;
    _data["student_latitude"] = studentLatitude;
    _data["student_longitude"] = studentLongitude;
    if(school != null) {
      _data["school"] = school?.toJson();
    }
    if(pickUp != null) {
      _data["pick_up"] = pickUp?.toJson();
    }
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
  double? endingLatitude;
  double? endingLongitude;
  double? startingLatitude;
  double? startingLongitude;
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
    if(json["ending_latitude"] is double) {
      endingLatitude = json["ending_latitude"];
    }
    if(json["ending_longitude"] is double) {
      endingLongitude = json["ending_longitude"];
    }
    if(json["starting_latitude"] is double) {
      startingLatitude = json["starting_latitude"];
    }
    if(json["starting_longitude"] is double) {
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

class PickUp {
  String? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? pickUpName;

  PickUp({this.id, this.status, this.createdAt, this.updatedAt, this.pickUpName});

  PickUp.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
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
    if(json["pick_up_name"] is String) {
      pickUpName = json["pick_up_name"];
    }
  }

  static List<PickUp> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PickUp.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["pick_up_name"] = pickUpName;
    return _data;
  }
}

class School {
  String? id;
  String? email;
  String? phone;
  int? status;
  String? address;
  double? latitude;
  String? createdAt;
  double? longitude;
  String? updatedAt;
  String? schoolName;
  int? isSuperAdmin;
  int? studentCapacity;

  School({this.id, this.email, this.phone, this.status, this.address, this.latitude, this.createdAt, this.longitude, this.updatedAt, this.schoolName, this.isSuperAdmin, this.studentCapacity});

  School.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["status"] is int) {
      status = json["status"];
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["latitude"] is double) {
      latitude = json["latitude"];
    }
    if(json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if(json["longitude"] is double) {
      longitude = json["longitude"];
    }
    if(json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if(json["school_name"] is String) {
      schoolName = json["school_name"];
    }
    if(json["is_super_admin"] is int) {
      isSuperAdmin = json["is_super_admin"];
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
    _data["email"] = email;
    _data["phone"] = phone;
    _data["status"] = status;
    _data["address"] = address;
    _data["latitude"] = latitude;
    _data["createdAt"] = createdAt;
    _data["longitude"] = longitude;
    _data["updatedAt"] = updatedAt;
    _data["school_name"] = schoolName;
    _data["is_super_admin"] = isSuperAdmin;
    _data["student_capacity"] = studentCapacity;
    return _data;
  }
}