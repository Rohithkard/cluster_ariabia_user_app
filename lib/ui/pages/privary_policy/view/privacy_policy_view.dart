import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/privary_policy/bind/privacy_policy_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonBackGroundColor,
      appBar: commonAppBarBack('Privacy Policy', primaryColorPurple,(){}),
      body: GetBuilder<PrivacyPolicyController>(
        builder: (logic) {
      return WebViewWidget(controller: logic.webViewController);
    }
    ),
    );
  }
}
