import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: primaryColorPurple,
      body: InkWell(
        onTap: (){
          Get.toNamed(Routes.login);
        },
          child: Image.asset(racoImage_R,width:80,height: 80,).cToCenter),
    );
  }
}
