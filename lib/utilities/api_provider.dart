import 'package:cluster_arabia/models/banner_list_model.dart';
import 'package:cluster_arabia/models/base_model_class.dart';
import 'package:cluster_arabia/models/coupon_list_model.dart';
import 'package:cluster_arabia/models/coupon_validation_model.dart';
import 'package:cluster_arabia/models/disable_childran_model.dart';
import 'package:cluster_arabia/models/help&support_create_model.dart';
import 'package:cluster_arabia/models/help&support_list_model.dart';
import 'package:cluster_arabia/models/home_page_models.dart';
import 'package:cluster_arabia/models/invoice_list_model.dart';
import 'package:cluster_arabia/models/login_model.dart';
import 'package:cluster_arabia/models/otp_verify_model.dart';
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/models/student_by_id.dart';
import 'package:cluster_arabia/models/student_list_model.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/dio.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Api extends GetConnect {
//------------------------------- oms -------------------------------
  static Api get to => Get.find();
  final error = false;
  final message = 'some error';
  var err = {'error': false, 'message': 'Network Or Other related issue'};

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = baseURL;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] =
          AppSession.to.session.read(SessionKeys.API_KEY) ?? '';
      request.headers['ngrok-skip-browser-warning'] = "skip";
      return request;
    });
  }

  Future<LoginModel> userLogin({
    required String phone,
  }) {
    return post(
      'p/auth/login/otp/request',
      FormData(
        {
          'mobile_or_email': phone,
        },
      ),
    ).then((value) {
      return LoginModel.fromJson(value.body ?? err);
    });
  }

  Future<DisableChildModel> disableChild({
    required String studentId,
    required String reason,
    required String serviceEndedDate,
  }) {
    return post(
      'p/disable/create',
      FormData(
        {
          'student_id': studentId,
          'reason': reason,
          'service_end_requested': serviceEndedDate,
        },
      ),
    ).then((value) {
      return DisableChildModel.fromJson(value.body ?? err);
    });
  }

  Future<BaseModelClass> postFcmToken({
    required String fcmToken,
  }) {
    return post(
      'p/fcm/update',
      FormData(
        {
          'fcm_token': fcmToken,
        },
      ),
    ).then((value) {
      print('Fcm Update : ${value.body}');
      return BaseModelClass.fromJson(value.body ?? err);
    });
  }

  Future<OtpModelClass> otpVerifyOtp({
    required String otpToken,
    required String otp,
  }) {
    return post(
      'p/auth/login/otp/verify',
      FormData(
        {
          'otp_token': otpToken,
          'otp': otp,
        },
      ),
    ).then((value) {
      return OtpModelClass.fromJson(value.body ?? err);
    });
  }

  Future<ProfileModel> getProfile() {
    return get('p/auth/profile').then((value) {
      print('got Profile ====> ${value?.body}');
      return ProfileModel.fromJson(value.body ?? err);
    });
  }

  Future<StudentModelList> getStudentsList({
    var search,
    var routeId,
    var pickUpId,
    var country,
    var state,
    var schoolId,
    required var status,
    required var page,
  }) {
    if (kDebugMode) {
      print(
          'Url : -- p/student/list/$page?search=$search&route_id=$routeId&pickup_id=$pickUpId&country=$country&state=$state&school_id=$schoolId&status=$status');
    }
    return get(
            'p/student/list/$page?search=$search&route_id=$routeId&pickup_id=$pickUpId&country=$country&state=$state&school_id=$schoolId&status=$status')
        .then((value) {
      return StudentModelList.fromJson(value.body ?? err);
    });
  }

  Future<StudentViewById> getStudentById({
    required var studentId,
  }) {
    return get('p/student/view/$studentId').then((value) {
      return StudentViewById.fromJson(value.body ?? err);
    });
  }

  Future<BannerListModel> getBannerList({
    required var bannerTYpe,
  }) {
    return get('p/ads/list?type=$bannerTYpe').then((value) {
      return BannerListModel.fromJson(value.body ?? err);
    });
  }

  Future<InvoiceListModel> getInvoiceList({
    required var page,
    var studentId,
    var startDate,
    var endDate,
    var paidStatus,
  }) {
    print(
        'Invoice List Url :p/bill/list/$page?student_id=$studentId&start_date=$startDate&end_date=$endDate&paid_status=$paidStatus');
    return get(
            'p/bill/list/$page?student_id=$studentId&start_date=$startDate&end_date=$endDate&paid_status=$paidStatus')
        .then((value) {
      print('ooooooo${value.body}');
      return InvoiceListModel.fromJson(value.body ?? err);
    });
  }

  Future<HomeBillAmount> getHomePageBillAmount({
    required String startDate,
    required String endDate,
  }) {
    return post(
      'p/bill/view/home',
      FormData(
        {
          'startDate': startDate,
          'endDate': endDate,
        },
      ),
    ).then((value) {
      return HomeBillAmount.fromJson(value.body ?? err);
    });
  }

  Future<CouponModelList> getCouponList({
    required var page,
  }) {
    return get('p/coupon/list/$page').then((value) {
      if (kDebugMode) {
        print('.....${value.body}');
      }
      return CouponModelList.fromJson(value.body ?? err);
    });
  }

  Future<HelpAndSupportModelList> getHelpList({
    required var page,
  }) {
    return get('p/help/list/$page').then((value) {
      return HelpAndSupportModelList.fromJson(value.body ?? err);
    });
  }

  Future<HelpAndSupportCreateModel> postHelpAndSupport(
      {required var subject,
      required var content,
      required var contactNumber}) {
    return post(
      'p/help/create',
      FormData(
        {
          'subject': subject,
          'content': content,
        },
      ),
    ).then((value) {
      if (kDebugMode) {
        print('Help And Support => ${value.body}');
      }
      return HelpAndSupportCreateModel.fromJson(value.body ?? err);
    });
  }

  Future<CouponModel> validateCoupon({
    required var couponId,
    required var bilNo,
  }) {
    return post(
      'p/coupon/value',
      FormData(
        {
          'couponCode': couponId,
          'bill_no': bilNo,
        },
      ),
    ).then((value) {
      if (kDebugMode) {
        print('coupon apply => ${value.body}');
      }
      return CouponModel.fromJson(value.body ?? err);
    });
  }

  Future<CouponModel> couponValidate({
    required var couponId,
    required var studentId,
  }) {
    return get(
      'coupon/validate?student=$studentId&coupon=$couponId',
    ).then((value) {
      if (kDebugMode) {
        print('validate coupon: ${value.body}');
      }
      return CouponModel.fromJson(value.body ?? err);
    });
  }
}
