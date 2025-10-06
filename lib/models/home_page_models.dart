class HomeBillAmount {
  bool? success;
  String? message;
  String? instance;
  Data? data;

  HomeBillAmount({this.success, this.message, this.instance, this.data});

  HomeBillAmount.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) {
      success = json["success"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["instance"] is String) {
      instance = json["instance"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    _data["instance"] = instance;
    if (data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? totalPayableAmount;
  int? totalAmount;
  int? totalTax;
  int? taxPercentage;
  List<MonthlyCharge>? monthlyCharge;
  Parent? parent;
  List<Students1>? students;

  Data(
      {this.totalPayableAmount,
      this.totalAmount,
      this.totalTax,
      this.taxPercentage,
      this.monthlyCharge,
      this.parent,
      this.students});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["totalPayableAmount"] is num) {
      totalPayableAmount = (json["totalPayableAmount"] as num).toInt();
    }
    if (json["totalAmount"] is num) {
      totalAmount = (json["totalAmount"] as num).toInt();
    }
    if (json["totalTax"] is num) {
      totalTax = (json["totalTax"] as num).toInt();
    }
    if (json["taxPercentage"] is num) {
      taxPercentage = (json["taxPercentage"] as num).toInt();
    }
    if (json["monthlyCharge"] is List) {
      monthlyCharge = json["monthlyCharge"] == null
          ? null
          : (json["monthlyCharge"] as List)
              .map((e) => MonthlyCharge.fromJson(e))
              .toList();
    }
    if (json["parent"] is Map) {
      parent = json["parent"] == null ? null : Parent.fromJson(json["parent"]);
    }
    if (json["students"] is List) {
      students = json["students"] == null
          ? null
          : (json["students"] as List)
              .map((e) => Students1.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["totalPayableAmount"] = totalPayableAmount;
    _data["totalAmount"] = totalAmount;
    _data["totalTax"] = totalTax;
    _data["taxPercentage"] = taxPercentage;
    if (monthlyCharge != null) {
      _data["monthlyCharge"] = monthlyCharge?.map((e) => e.toJson()).toList();
    }
    if (parent != null) {
      _data["parent"] = parent?.toJson();
    }
    if (students != null) {
      _data["students"] = students?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Students1 {
  String? id;
  String? studentName;
  String? admissionNo;
  String? gender;
  String? parentType;
  String? country;
  String? state;
  String? address;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? img;
  String? classNo;
  double? studentLatitude;
  double? studentLongitude;
  School? school;
  PickUp? pickUp;
  BusInRoute? busInRoute;

  Students1(
      {this.id,
      this.studentName,
      this.admissionNo,
      this.gender,
      this.parentType,
      this.country,
      this.state,
      this.address,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.img,
      this.classNo,
      this.studentLatitude,
      this.studentLongitude,
      this.school,
      this.pickUp,
      this.busInRoute});

  Students1.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["student_name"] is String) {
      studentName = json["student_name"];
    }
    if (json["admission_no"] is String) {
      admissionNo = json["admission_no"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["parent_type"] is String) {
      parentType = json["parent_type"];
    }
    if (json["country"] is String) {
      country = json["country"];
    }
    if (json["state"] is String) {
      state = json["state"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["class"] is String) {
      classNo = json["class"];
    }
    if (json["student_latitude"] is num) {
      studentLatitude = (json["student_latitude"] as num).toDouble();
    }
    if (json["student_longitude"] is num) {
      studentLongitude = (json["student_longitude"] as num).toDouble();
    }
    if (json["school"] is Map) {
      school = json["school"] == null ? null : School.fromJson(json["school"]);
    }
    if (json["pick_up"] is Map) {
      pickUp =
          json["pick_up"] == null ? null : PickUp.fromJson(json["pick_up"]);
    }
    if (json["bus_in_route"] is Map) {
      busInRoute = json["bus_in_route"] == null
          ? null
          : BusInRoute.fromJson(json["bus_in_route"]);
    }
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
    _data["address"] = address;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["img"] = img;
    _data["class"] = classNo;
    _data["student_latitude"] = studentLatitude;
    _data["student_longitude"] = studentLongitude;
    if (school != null) {
      _data["school"] = school?.toJson();
    }
    if (pickUp != null) {
      _data["pick_up"] = pickUp?.toJson();
    }
    if (busInRoute != null) {
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
    if (json["bus_info"] is Map) {
      busInfo =
          json["bus_info"] == null ? null : BusInfo.fromJson(json["bus_info"]);
    }
    if (json["route_info"] is Map) {
      routeInfo = json["route_info"] == null
          ? null
          : RouteInfo.fromJson(json["route_info"]);
    }
    if (json["bus_route_id"] is String) {
      busRouteId = json["bus_route_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (busInfo != null) {
      _data["bus_info"] = busInfo?.toJson();
    }
    if (routeInfo != null) {
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

  RouteInfo(
      {this.id,
      this.gender,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.isTwoWay,
      this.routeName,
      this.endingPoint,
      this.fareForRoute,
      this.startingPoint,
      this.endingLatitude,
      this.endingLongitude,
      this.startingLatitude,
      this.startingLongitude,
      this.morningStartingTime,
      this.afternoonStartingTime});

  RouteInfo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["gender"] is String) {
      gender = json["gender"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["is_two_way"] is num) {
      isTwoWay = (json["is_two_way"] as num).toInt();
    }
    if (json["route_name"] is String) {
      routeName = json["route_name"];
    }
    if (json["ending_point"] is String) {
      endingPoint = json["ending_point"];
    }
    if (json["fare_for_route"] is num) {
      fareForRoute = (json["fare_for_route"] as num).toInt();
    }
    if (json["starting_point"] is String) {
      startingPoint = json["starting_point"];
    }
    if (json["ending_latitude"] is num) {
      endingLatitude = (json["ending_latitude"] as num).toDouble();
    }
    if (json["ending_longitude"] is num) {
      endingLongitude = (json["ending_longitude"] as num).toDouble();
    }
    if (json["starting_latitude"] is num) {
      startingLatitude = (json["starting_latitude"] as num).toDouble();
    }
    if (json["starting_longitude"] is num) {
      startingLongitude = (json["starting_longitude"] as num).toDouble();
    }
    if (json["morning_starting_time"] is String) {
      morningStartingTime = json["morning_starting_time"];
    }
    if (json["afternoon_starting_time"] is String) {
      afternoonStartingTime = json["afternoon_starting_time"];
    }
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

  BusInfo(
      {this.id,
      this.busNo,
      this.gpsId,
      this.busModel,
      this.driverName,
      this.driverPhone,
      this.studentCapacity});

  BusInfo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["bus_no"] is String) {
      busNo = json["bus_no"];
    }
    if (json["gps_id"] is String) {
      gpsId = json["gps_id"];
    }
    if (json["bus_model"] is String) {
      busModel = json["bus_model"];
    }
    if (json["driver_name"] is String) {
      driverName = json["driver_name"];
    }
    if (json["driver_phone"] is String) {
      driverPhone = json["driver_phone"];
    }
    if (json["student_capacity"] is num) {
      studentCapacity = (json["student_capacity"] as num).toInt();
    }
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

  PickUp(
      {this.id, this.status, this.createdAt, this.updatedAt, this.pickUpName});

  PickUp.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["pick_up_name"] is String) {
      pickUpName = json["pick_up_name"];
    }
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

  School(
      {this.id,
      this.email,
      this.phone,
      this.status,
      this.address,
      this.latitude,
      this.createdAt,
      this.longitude,
      this.updatedAt,
      this.schoolName,
      this.isSuperAdmin,
      this.studentCapacity});

  School.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["latitude"] is num) {
      latitude = (json["latitude"] as num).toDouble();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["longitude"] is num) {
      longitude = (json["longitude"] as num).toDouble();
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["school_name"] is String) {
      schoolName = json["school_name"];
    }
    if (json["is_super_admin"] is num) {
      isSuperAdmin = (json["is_super_admin"] as num).toInt();
    }
    if (json["student_capacity"] is num) {
      studentCapacity = (json["student_capacity"] as num).toInt();
    }
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

class Parent {
  String? id;
  String? parentName;
  String? email;
  String? parentPhone;
  String? address;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? img;
  int? parentLatitude;
  int? parentLongitude;

  Parent(
      {this.id,
      this.parentName,
      this.email,
      this.parentPhone,
      this.address,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.img,
      this.parentLatitude,
      this.parentLongitude});

  Parent.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["parent_name"] is String) {
      parentName = json["parent_name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["parent_phone"] is String) {
      parentPhone = json["parent_phone"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["status"] is num) {
      status = (json["status"] as num).toInt();
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["img"] is String) {
      img = json["img"];
    }
    if (json["parent_latitude"] is num) {
      parentLatitude = (json["parent_latitude"] as num).toInt();
    }
    if (json["parent_longitude"] is num) {
      parentLongitude = (json["parent_longitude"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["parent_name"] = parentName;
    _data["email"] = email;
    _data["parent_phone"] = parentPhone;
    _data["address"] = address;
    _data["status"] = status;
    _data["createdAt"] = createdAt;
    _data["updatedAt"] = updatedAt;
    _data["img"] = img;
    _data["parent_latitude"] = parentLatitude;
    _data["parent_longitude"] = parentLongitude;
    return _data;
  }
}

class MonthlyCharge {
  String? monthName;
  String? monthNumber;
  int? amount;
  int? tax;
  int? taxPercentage;
  String? type;
  List<Students>? students;
  String? year;

  MonthlyCharge(
      {this.monthName,
      this.monthNumber,
      this.amount,
      this.tax,
      this.taxPercentage,
      this.type,
      this.students,
      this.year});

  MonthlyCharge.fromJson(Map<String, dynamic> json) {
    if (json["month_name"] is String) {
      monthName = json["month_name"];
    }
    if (json["month_number"] is String) {
      monthNumber = json["month_number"];
    }
    if (json["amount"] is num) {
      amount = (json["amount"] as num).toInt();
    }
    if (json["tax"] is num) {
      tax = (json["tax"] as num).toInt();
    }
    if (json["tax_percentage"] is num) {
      taxPercentage = (json["tax_percentage"] as num).toInt();
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["students"] is List) {
      students = json["students"] == null
          ? null
          : (json["students"] as List)
              .map((e) => Students.fromJson(e))
              .toList();
    }
    if (json["year"] is String) {
      year = json["year"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["month_name"] = monthName;
    _data["month_number"] = monthNumber;
    _data["amount"] = amount;
    _data["tax"] = tax;
    _data["tax_percentage"] = taxPercentage;
    _data["type"] = type;
    if (students != null) {
      _data["students"] = students?.map((e) => e.toJson()).toList();
    }
    _data["year"] = year;
    return _data;
  }
}

class Students {
  String? id;
  String? name;
  String? schoolId;
  int? amount;
  int? tax;
  int? taxPercentage;

  Students(
      {this.id,
      this.name,
      this.schoolId,
      this.amount,
      this.tax,
      this.taxPercentage});

  Students.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["school_id"] is String) {
      schoolId = json["school_id"];
    }
    if (json["amount"] is num) {
      amount = (json["amount"] as num).toInt();
    }
    if (json["tax"] is num) {
      tax = (json["tax"] as num).toInt();
    }
    if (json["tax_percentage"] is num) {
      taxPercentage = (json["tax_percentage"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["school_id"] = schoolId;
    _data["amount"] = amount;
    _data["tax"] = tax;
    _data["tax_percentage"] = taxPercentage;
    return _data;
  }
}
