
import 'package:cluster_arabia/models/coupon_list_model.dart' as couponList;
import 'package:cluster_arabia/ui/pages/contact_us/bind/contact_us_bind.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CouponBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CouponController());
  }
}

class CouponController extends GetxController {
  static CouponController get to => Get.find();

  couponList.CouponModelList? couponModelList;
  late ScrollController scrollController;
  List<couponList.Coupons> couponLists = [];
  late BuildContext context;
  bool hasNextPage = false;
  var pageNO = 1;


  @override
  void onInit() {
    couponLists.clear();
    pageNO = 1;
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });
    getCouponList();
    super.onInit();
  }

  @override
  void dispose() {
    ContactUsController.to.dispose();
    super.dispose();
  }


  void loadMore() async {
    if (hasNextPage) {
      pageNO = pageNO + 1;
      if (kDebugMode) {
        print('////$pageNO');
      }
      getCouponList();
      // isLoadMoreRunning = false;
    } else {
      debugPrint('');
    }
  }



  void getCouponList() async {
    try {
      showLoading();
      couponModelList = await Api.to.getCouponList(page: pageNO,
      );
      dismissLoading();
      if (!(couponModelList?.success ?? true)) {
        showToast(context: context, message: couponModelList?.message ?? '');
      } else {
        hasNextPage =
        ((couponModelList?.data?.coupons ?? []).length == 20) ? true : false;
        couponLists.addAll((couponModelList?.data?.coupons ?? []));
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

}