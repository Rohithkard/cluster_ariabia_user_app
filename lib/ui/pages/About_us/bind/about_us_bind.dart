import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AboutUsController());
  }
}

class AboutUsController extends GetxController {
  static AboutUsController get to => Get.find();
  late final WebViewController webViewController;

  @override
  void onInit() {
    openWebView(url: 'https://racotransport.com/about-us.php');
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
