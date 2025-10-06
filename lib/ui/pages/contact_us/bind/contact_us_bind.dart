import 'package:cluster_arabia/models/help&support_create_model.dart';
import 'package:cluster_arabia/models/profile_model.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ContactUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ContactUsController());
  }
}

class ContactUsController extends GetxController {
  static ContactUsController get to => Get.find();

  var helpAndSupportFormKey = GlobalKey<FormState>();
  HelpAndSupportCreateModel?helpAndSupportCreateModel;
  ProfileModel? profileModel;


  final subject = TextEditingController();
  final complaint = TextEditingController();
  final contactNumber = TextEditingController();
  late BuildContext context;

  @override
  void onInit() {
    subject.clear();
    complaint.clear();
    getProfile();
    postHelpAndSupport();
    super.onInit();
  }


  Future<void> postHelpAndSupport() async {
    try {
      10.cDelay(() {
        dismissLoading();
      });
      if (helpAndSupportFormKey.currentState?.validate() ?? false) {
        showLoading();
        helpAndSupportCreateModel = await Api.to.postHelpAndSupport(
          content:complaint.text,
          subject: subject.text,
          contactNumber: contactNumber.text,
        );
        update();
        dismissLoading();
        if (helpAndSupportCreateModel?.success ?? true) {
          Get.defaultDialog(
            middleText: 'Feedback added successfully',
          );
          subject.clear();
          complaint.clear();
          // Get.back();
        } else {

        }
      }
    } catch (ex) {
      dismissLoading();
      EasyLoading.showToast('Error occurred $ex');
    }
  }

  void getProfile() async {
    try {
      showLoading();
      profileModel = await Api.to.getProfile();
      dismissLoading();
      if (!(profileModel?.success ?? true)) {
        showToast(context: context, message: profileModel?.message ?? '');
      }else{
        contactNumber.text=profileModel?.data?.phone??'';
        update();
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }


}