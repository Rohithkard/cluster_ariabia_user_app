
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ComBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Api(), fenix: true);
    Get.put(AppSession());
  }
}

class AppSession extends GetxController {
  static AppSession get to => Get.find();
  var session = GetStorage('cluster_arabia');


  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void logout() {
    AppSession.to.session.erase();
    Get.offNamed(Routes.splash);
  }

}
