import 'package:get/get.dart';

class PrivacyPolicyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivacyPolicyController());
  }
}

class PrivacyPolicyController extends GetxController {
  static PrivacyPolicyController get to => Get.find();
}