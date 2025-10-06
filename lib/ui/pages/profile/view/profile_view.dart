import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/ui/pages/profile/view/profile_more.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeStackDashboardController.to.context = context;
    return WillPopScope(
      onWillPop: () async {
        HomeStackDashboardController.to.changeTabIndex(0);
       return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: InkWell(
              onTap: () {
                HomeStackDashboardController.to.changeTabIndex(0);
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
              )),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [ProfileImagePart(), ListTilePart(), AddressSection(),
              DeleteAccount()],
          ),
        ),
      ),
    );
  }
}
