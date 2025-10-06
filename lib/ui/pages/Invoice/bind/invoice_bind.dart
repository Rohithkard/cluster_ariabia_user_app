// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cluster_arabia/models/coupon_validation_model.dart';
import 'package:cluster_arabia/models/invoice_list_model.dart' as invoice;
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/dio.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:cluster_arabia/models/student_list_model.dart' as student;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InvoiceController());
  }
}

class InvoiceController extends GetxController {
  static InvoiceController get to => Get.find();
  final dateRangeController = DateRangePickerController();
  late BuildContext context;
  invoice.InvoiceListModel? invoiceListModel;
  student.StudentModelList? studentModelList;
  ProfileModel? profileModel;
  student.DataList? billFilterStudentChooses;
  var filterChooses = '';
  var stdName;
  var tax;
  var amount;

  // Controller TO The Web View
  // late final WebViewController webViewController;

  List<invoice.DataList> invoiceList = [];
  var pageNO = 1;
  final RxString selectDropDownValue = 'Student Name'.obs;

  // List<String> categoryItems = [];

  DateRange? selectedDateRange;
  var startDatePass;

  var endDatePass;
  late ScrollController scrollController;
  bool hasNextPage = false;

  DateTime? startMonth;
  DateTime? endMonth;

  void setStartMonth(DateTime month) {
    startMonth = month;
    update(); // This triggers the UI updates
  }

  void setEndMonth(DateTime month) {
    endMonth = month;
    update(); // This triggers the UI updates
  }

  clearData() {
    startMonth = null;
    endMonth = null;
    filterChooses = '';
    invoiceList.clear();
    filterChooses = '';
    startDatePass = null;
    endDatePass = null;
    billFilterStudentChooses = null;
    dateRangeController.selectedRanges = [];
    dateRangeController.selectedRanges = [];
    update();
  }

  @override
  void onInit() {
    clearData();
    // webViewController = WebViewController();
    pageNO = 1;
    getProfile();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    getInvoiceList();
    getStudentData();

    super.onInit();
  }

  void loadMore() async {
    if (hasNextPage) {
      pageNO = pageNO + 1;
      getInvoiceList();
      // isLoadMoreRunning = false;
    } else {
      debugPrint('');
    }
  }

  String studentsName() {
    return (studentModelList?.data?.dataList ?? [])
        .map((item) => item.studentName.toString())
        .join(', ');
  }

  void getInvoiceList() async {
    try {
      showLoading();
      invoiceListModel = await Api.to.getInvoiceList(
        page: pageNO,
        studentId: filterChooses,
        startDate: startDatePass,
        endDate: endDatePass,
      );
      dismissLoading();
      if (!(invoiceListModel?.success ?? true)) {
        showToast(context: context, message: invoiceListModel?.message ?? '');
      } else {
        hasNextPage = ((invoiceListModel?.data?.dataList ?? []).length == 20)
            ? true
            : false;
        invoiceList.addAll((invoiceListModel?.data?.dataList ?? []));
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  Future<void> getStudentData() async {
    try {
      showLoading();
      studentModelList = await Api.to.getStudentsList(status: true, page: 1);
      dismissLoading();
      if (!(studentModelList?.success ?? true)) {
        showToast(context: context, message: studentModelList?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  void getProfile() async {
    try {
      showLoading();
      profileModel = await Api.to.getProfile();
      dismissLoading();
      if (!(profileModel?.success ?? true)) {
        showToast(context: context, message: profileModel?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  TextEditingController couponCode = TextEditingController();
  var couponCodePass = '';
  CouponModel? couponModel;
  void couponIsValid(
    String invoiceNo,
  ) async {
    try {
      10.cDelay(() {
        EasyLoading.dismiss();
      });
      if (couponCode.text.isEmpty) {
        EasyLoading.showToast('Please enter the Voucher code');
        return;
      }
      EasyLoading.show(status: 'loading...');
      couponModel = await Api.to
          .validateCoupon(couponId: (couponCode.text).trim(), bilNo: invoiceNo);
      EasyLoading.dismiss();
      if (!(couponModel?.success ?? true)) {
        EasyLoading.showToast(couponModel?.message ?? '');
        return;
      }

      if (((couponModel?.data?.error ?? '').toString()).isNotEmpty) {
        EasyLoading.showToast(couponModel?.data?.error ?? '');
      } else {
        couponCodePass = (couponCode.text).trim();
        EasyLoading.showToast('Voucher Applied');
        update();
      }
    } catch (e) {
      EasyLoading.showToast('Error : $e');
    }
  }

  void openBillInBrowser({required String billId}) async {
    var url = '${baseURL}view_bill/$billId';
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
