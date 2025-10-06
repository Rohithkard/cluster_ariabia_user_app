import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  @override
  void onInit() {
    3.cDelay(() {
      checkLogin();
    });
    super.onInit();
  }

  void checkLogin() async {
    print('Session Keys=>${(AppSession.to.session.read(SessionKeys.API_KEY))}');
    if (AppSession.to.session.read(SessionKeys.API_KEY) != null) {
      Get.offAllNamed(Routes.homeStackDashboard);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
