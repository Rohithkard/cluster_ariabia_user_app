import 'package:cluster_arabia/models/disable_childran_model.dart';
import 'package:cluster_arabia/models/student_by_id.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChildrenInnerPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChildrenInnerPageController());
  }
}

class ChildrenInnerPageController extends GetxController {
  static ChildrenInnerPageController get to => Get.find();
  StudentViewById? studentViewById;
  late BuildContext context;
  DisableChildModel? disableChildModel;
  var studentId;
  var dateTimeChoose = 'Select Date';
  DateTime? selectedDate;
  TextEditingController reasonTextFormField = TextEditingController();

  CameraPosition kGooglePlex = const CameraPosition(
    target: LatLng(11.236297899106287, 76.05035632326266),
    zoom: 14.4746,
  );

  @override
  void onInit() {
    var argument = Get.arguments;
    if (argument != null) {
      studentId = argument[0];
      getStudentById();
    }
    super.onInit();
  }

  @override
  void dispose() {
    ChildrenInnerPageController.to.dispose();
    super.dispose();
  }

  void getStudentById() async {
    try {
      showLoading();
      studentViewById = await Api.to.getStudentById(studentId: studentId);
      dismissLoading();
      if (!(studentViewById?.success ?? true)) {
        showToast(context: context, message: studentViewById?.message ?? '');
      }
    } catch (e) {
      showToast(context: context, message: e.toString());
    } finally {
      update();
    }
  }

  onSelectionChanged() {}

  void selectDate({required BuildContext context}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      dateTimeChoose = picked.cGetFormattedDate(format: 'MMM-dd-yyyy');
      update();
    }
  }
clearVariable(){
  reasonTextFormField.clear();
  dateTimeChoose = 'Select Date';
  update();
}
  void raiseRequest() async {
    try {
      if (reasonTextFormField.text.isEmpty) {
        showToast(
            context: context, message: 'Please provide a reason to continue');
        return;
      }
      if (dateTimeChoose == 'Select Date') {
        showToast(
            context: context, message: 'Please provide a date to continue');
        return;
      }
      disableChildModel = await Api.to.disableChild(
          studentId: studentId,
          reason: reasonTextFormField.text,
          serviceEndedDate:
              selectedDate.toString().cGetFormattedDate(format: 'yyy-MM-dd'));
      if (disableChildModel?.success ?? true) {
        Get.back();
      } else {
        showToast(context: context, message: disableChildModel?.message ?? '');
      }
    } catch (e) {
      print('Raise Request : ${e}');
    } finally {
      update();
    }
  }
}
