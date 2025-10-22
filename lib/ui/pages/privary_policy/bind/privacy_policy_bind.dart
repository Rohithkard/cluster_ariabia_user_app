import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivacyPolicyController());
  }
}

class PrivacyPolicyController extends GetxController {
  static PrivacyPolicyController get to => Get.find();
  late final WebViewController webViewController;

  @override
  void onInit() {
    openWebView(url: 'https://app.racotransport.com/privacy_policy');
    super.onInit();
  }

  void openWebView({required String url}) {
    EasyLoading.show();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String newUrl) {
            // Perform actions when the page starts loading
          },
          onPageFinished: (String newUrl) async {
            EasyLoading.dismiss();
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onWebResourceError: (WebResourceError error) {
            Get.snackbar("Error", "Failed to load page.");
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

}