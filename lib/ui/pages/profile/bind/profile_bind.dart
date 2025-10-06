import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  ProfileModel? profileModel;
  late BuildContext context;

  @override
  void onInit() {
    getProfile();
    super.onInit();
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

  void deleteAccount() async {
    try {
      showLoading();
      await Future.delayed(const Duration(milliseconds: 500));
      dismissLoading();
      // showToast(context: context,message: 'Your deletion request  submitted successfully');
      // EasyLoading.showToast('Your deletion request  submitted successfully');
      AppSession.to.logout();
    } catch (ex) {
      dismissLoading();
      debugPrint('Error occurred during deleteAccount: $ex');
    }
  }
}
