
import 'package:cluster_arabia/models/banner_list_model.dart';
import 'package:cluster_arabia/models/base_model_class.dart';
import 'package:cluster_arabia/models/coupon_validation_model.dart';
import 'package:cluster_arabia/models/home_page_models.dart' as student;
import 'package:cluster_arabia/models/invoice_list_model.dart' as invoice;
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/models/student_list_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  var startDatePass = '', endDatePass = '';
  final currentPage = 0.obs;

  TextEditingController couponCode = TextEditingController();

  ProfileModel? profileModel;
  BannerListModel? bannerListModel;
  BannerListModel? sliderModel;
  student.HomeBillAmount? homeBillAmount;
  StudentModelList? studentModelList;
  CouponModel? couponModel;
  BaseModelClass? baseModelClass;
  invoice.InvoiceListModel? invoiceListModel;
  List<invoice.DataList> invoiceList = [];
  bool hasNextPage = false;

  late BuildContext context;
  DateTime? startMonth;
  DateTime? endMonth;
  var totWidth = 60;
  var isAddMore = false.obs;
  var validCouponText = '';
  var paymentType = 'pay_at_shop'.obs;
  var singleLineText;
  List<String> sId = [''];
  RxString pId = ''.obs;
  RxBool isValidCoupon = false.obs;
  var pageNO = 1;
  var totalAmount = 0.0;

  @override
  void onInit() {
    invoiceList.clear();
    totalAmount = 0.0;
    fetchDataOnInit();
    super.onInit();
  }

  Future<void> fetchDataOnInit() async {
    showLoading();
    await Future.wait([
      getProfile(),
      getHomeAmount(),
      getHomeBill(),
      getBannerData(),
      getSliderData(),
      getStudentList(),
      postFcmToken()
    ]);
    dismissLoading();
  }

  clearVariable() {
    sId.clear();
    pId.value = '';
  }

  Future<void> getStudentList() async {
    try {
      showLoading();
      studentModelList = await Api.to.getStudentsList(
        status: "true",
        page: 1,
        search: '',
      );
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

  Future<void> getProfile() async {
    try {
      profileModel = await Api.to.getProfile();
      update();
      if (!(profileModel?.success ?? true)) {
        showToast(context: context, message: profileModel?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  Future<void> getHomeAmount() async {
    try {
      homeBillAmount = await Api.to.getHomePageBillAmount(
          startDate: startDatePass, endDate: endDatePass);
      if (!(homeBillAmount?.success ?? true)) {
        // showToast(context: context, message: homeBillAmount?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  Future<void> getHomeBill() async {
    try {
      showLoading();
      invoiceListModel = await Api.to.getInvoiceList(
          page: pageNO,
          // studentId: filterChoosed,
          startDate: startDatePass,
          endDate: endDatePass,
          paidStatus: false);
      dismissLoading();
      totalBillAmt();
      if (!(invoiceListModel?.success ?? true)) {
        // showToast(context: context, message: invoiceListModel?.message ?? '');
      } else {
        hasNextPage = ((invoiceListModel?.data?.dataList ?? []).length == 20)
            ? true
            : false;
        invoiceList.addAll((invoiceListModel?.data?.dataList ?? []));

        print('jjjjjjjjjj');
        print('######${invoiceList.length}');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  // void main() {
  //   List<student.Students1> items = homeBillAmount?.data?.students??[];
  //   // List<dynamic> items = ['apple', 123, true];
  //    singleLineText = (items).map((item) => item.studentName.toString()).join(', ');
  //   print('**********${singleLineText}');
  // }

  // Future<void> totalBillAmt() async {
  //   // Create a list of amounts
  //   List<double> amounts = [(double.parse('${invoiceListModel?.data?.dataList?.cFirst?.amount ?? '0'}') + double.parse('${invoiceListModel?.data?.dataList?.cFirst?.taxAmount ?? '0'}')) / 100];
  //
  //   List<double> mappedAmounts = amounts.map((amount) => amount).toList();
  //
  //   // Calculate the total amount using reduce
  //    totalAmount = mappedAmounts.fold(0.0,(sum, element) => sum + element);
  //
  //
  //     // Calculate the total amount
  //     totalAmount = amounts.fold(0.0, (sum, element) => sum + element);
  //
  //
  //   // Print the total amount
  //   print("Total amount: \$${totalAmount.toStringAsFixed(2)}");
  //   update();
  //
  // }
  Future<void> totalBillAmt() async {
    cLog('THis Worked');
    List<invoice.DataList> items = invoiceListModel?.data?.dataList ?? [];
    // List<dynamic> items = ['apple', 123, true];
    for (var item in items) {
      totalAmount += double.parse(('${item.amount ?? 0}')) +
          double.parse(('${item.taxAmount ?? 0}'));
    }
    // totalAmount += (items).map((item) => item.amount??0.0+(item.taxAmount??0.0));
    print('**********${totalAmount}');
    update();
  }

  // String studentsName() {
  //   return (invoiceListModel?.data?.dataList ?? [])
  //   // return (homeBillAmount?.data?.students ?? [])
  //       .map((item) => item.student?.name.toString())
  //       .join(', ');
  // }
  String studentsName() {
    // Get the list of student names, filtering out nulls and duplicates
    final names = (invoiceListModel?.data?.dataList ?? [])
        .map((item) => item.student?.name?.toString())
        .where((name) => name != null)
        .toSet();

    // Convert the set back to a list and join the names with ', '
    return names.join(', ');
  }

  // String studentsId() {
  //   return (homeBillAmount?.data?.students ?? [])
  //       .map((item) => item.id.toString())
  //       .join('');
  // }

  Future<void> getBannerData() async {
    try {
      bannerListModel = await Api.to.getBannerList(bannerTYpe: 'banner');
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  Future<void> getSliderData() async {
    try {
      sliderModel = await Api.to.getBannerList(bannerTYpe: 'slider');
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  List<String> studentsId() {
    return (homeBillAmount?.data?.students ?? [])
        .map((item) => item.id.toString())
        .toList(); // Convert to a list for direct usage
  }

  var couponCodePass = '';

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

  Future<void> postFcmToken() async {
    try {
      baseModelClass = await Api.to.postFcmToken(
          fcmToken: GetStorage('cluster_arabia').read(SessionKeys.FCM_ID));
    } catch (ex) {
      cLog('Exception Is => $ex');
    }
  }

  void onClear() {
    invoiceList.clear();
  }
}
