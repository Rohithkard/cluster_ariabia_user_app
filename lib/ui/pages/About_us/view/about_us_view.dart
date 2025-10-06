import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/About_us/bind/about_us_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonBackGroundColor,
      appBar: commonAppBarBack('About Us', primaryColorPurple,(){
      }),
      body: GetBuilder<AboutUsController>(
        builder: (logic) {
          return WebViewWidget(controller: logic.webViewController);
        }
      ),
      // body: Column(children: [
      //   ListView.builder(
      //     itemCount: 3,
      //     shrinkWrap: true,
      //     itemBuilder: (context,i) {
      //       return const Text('"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."',textAlign: TextAlign.justify,).cPadOnly(t: 10,l: 15,r: 15);
      //     }
      //   )
      // ],),
    );
  }
}
