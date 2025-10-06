import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/payment_page/bind/payment_bind.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonBackGroundColor,
      appBar: AppBar(
        backgroundColor: primaryColorPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          (PaymentController.to.isPay) ? 'Payment Window' : 'View Bill',
          style: customStyle(14.0, Colors.white, FontWeight.normal),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: GetBuilder<PaymentController>(builder: (logic) {
        return Column(
          children: [
            Expanded(child: WebViewWidget(controller: logic.webViewController)),
            if (logic.isPay)
              Obx(() => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Closing in: ${logic.timer.value} seconds",
                      style: TextStyle(fontSize: 16, color: Colors.redAccent),
                    ),
                  )),
          ],
        );
      }),
    );
  }
}
