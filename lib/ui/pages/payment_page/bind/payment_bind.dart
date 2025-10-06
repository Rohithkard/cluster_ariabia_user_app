import 'dart:async';

import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentBind implements Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
  }
}

class PaymentController extends GetxController {
  static PaymentController get to => Get.find();
  late final WebViewController webViewController;
  Timer? countdownTimer;
  bool isPay = true;
  var timer = 600.obs; // 10 minutes (600 seconds)

  @override
  void onInit() {
    var arguments = Get.arguments;
    if (arguments != null) {
      isPay = arguments[1];
      openWebView(url: arguments[0]);
      if (isPay) startTimer();
    }
    super.onInit();
  }

  @override
  void onClose() {
    HomeController.to.onClear();
    HomeController.to.onInit();
    super.onClose();
  }

  @override
  void dispose() {
    HomeController.to.onInit();
    PaymentController.to.dispose();
    super.dispose();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer.value > 0) {
        this.timer.value--;
      } else {
        closePage();
        timer.cancel();
      }
    });
  }

  void closePage() {
    if (Get.isDialogOpen == true) {
      Get.back();
    } else {
      Get.back(result: "Page closed automatically.");
    }
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
            // cLog("Page finished loading: $newUrl");
            final pageTitle = await webViewController.getTitle();
            cLog("Current page title: $pageTitle");
            EasyLoading.dismiss();

            // You can detect screen changes by checking URLs or titles
            if (newUrl.contains("success")) {
              timer.value = 5;
            } else if ((newUrl.contains("failure")) ||
                newUrl.contains("cancel")) {
              timer.value = 5;
            }
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
