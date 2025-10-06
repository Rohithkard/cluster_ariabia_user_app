// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/Invoice/view/invoice_view.dart';
import 'package:cluster_arabia/ui/pages/children/view/children_view.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_view.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/ui/pages/profile/view/profile_view.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeStackDashboard extends StatelessWidget {
  DateTime? lastPressed = null;

  Future<bool> willPopCallback() async {
    final controller = HomeStackDashboardController.to;

    if (controller.indexedStack.value == 0) {
      // Exit app logic when on Home (index 0)
      final now = DateTime.now();
      if (lastPressed == null ||
          now.difference(lastPressed!) > const Duration(seconds: 2)) {
        Get.snackbar(
          'Exit',
          'Double Press to exit app',
          snackPosition: SnackPosition.TOP,
        );
        lastPressed = now;
        return Future.value(false);
      }
      return await showExitDialog();
    } else if (controller.previousTabIndex == 3) {
      if (controller.indexedStack.value == controller.previousTabIndex) {
        cLog(
            '1 ..${controller.indexedStack.value}>>${controller.previousTabIndex}');
        // If user was on Profile (index 3) and clicks back, return to Profile
        controller.changeTabIndex(0);
      } else {
        // If user was on Profile (index 3) and clicks back, return to Profile
        controller.changeTabIndex(3);
      }

      return false;
    } else {
      // Otherwise, navigate back to Home (index 0)
      controller.changeTabIndex(0);
      return false;
    }
  }

  Future<bool> showExitDialog() async {
    return await Get.dialog(
          AlertDialog(
            title: const Text('Confirm'),
            content: const Text('Do you want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: false), // Dismiss with false
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  if (cIsAndroid) {
                    SystemNavigator.pop();
                  } else if (cIsIOS) {
                    exit(0);
                  }
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  HomeStackDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    HomeStackDashboardController.to.context = context;
    return WillPopScope(
      onWillPop: willPopCallback,
      child: GetX<HomeStackDashboardController>(builder: (logic) {
        return Scaffold(
          key: logic.scaffoldKey,
          drawer: const HomeDrawer(),
          backgroundColor: Colors.white,
          body: IndexedStack(
            index: logic.indexedStack.value,
            children: const [
              HomePage(),
              InvoicePage(),
              ChildrenView(),
              ProfileView(),
              // MyAccountPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    // AssetImage(homeBottomIcon),
                    // homeIcon,
                    home_angle_Icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    // AssetImage(homeBottomIcon),
                    // homeIcon,
                    homeAngleFillIcon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Home',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    // transactionIcon,
                    invoice_narrow_Icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    // transactionIcon,
                    invoice_fill_Icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Invoice',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    // studentsIcon,
                    children_unfill_Icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    children_fill_Icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Students',
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    // profileIcon,
                    profile_unfill_Icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    profile_fill_Icon,
                    height: 25,
                    width: 25,
                  ),
                ),
                label: 'Profile',
                backgroundColor: Colors.white,
              ),
            ],
            elevation: 5,
            currentIndex: logic.tabIndex.value,
            selectedItemColor: primaryColorPurple,
            unselectedItemColor: const Color.fromRGBO(126, 126, 126, 1),
            selectedLabelStyle: customStyle(
              11.0,
              const Color.fromRGBO(0, 38, 89, 1),
              FontWeight.normal,
            ),
            unselectedLabelStyle: customStyle(
              11.0,
              const Color.fromRGBO(126, 126, 126, 1),
              FontWeight.normal,
            ),
            showUnselectedLabels: true,
            onTap: logic.changeTabIndex,
          ),
        );
      }),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeStackDashboardController>(
      builder: (logic) {
        return Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.zero,
            ),
          ),
          backgroundColor: Colors.white,
          child: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: 346,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25, // Image radius
                          backgroundImage:
                              NetworkImage(logic.profileModel?.data?.img ?? ''),
                        ),
                        // Image.network(
                        //   logic.profileModel?.data?.img??'',
                        //   height: 45,
                        //   width: 45,
                        // ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(logic.profileModel?.data?.name ?? '',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: customStyle(
                                      16.0, Colors.black, FontWeight.bold)),
                            ),
                            Text(logic.profileModel?.data?.email ?? '',
                                style: customStyle(
                                    12.0,
                                    const Color.fromRGBO(83, 97, 107, 1),
                                    FontWeight.normal)),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Color.fromRGBO(101, 101, 101, 1),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ListTileItem(
                      name: 'Home',
                      icon: homeIconDrawer,
                      onTap: () {
                        HomeStackDashboardController.to.cameFromProfile = false;
                        HomeStackDashboardController.to.changeTabIndex(0);
                        Get.back();
                      },
                      textColor: Color.fromRGBO(71, 42, 138, 1),
                      iconColor: Color.fromRGBO(71, 42, 138, 1),
                      choosedColor: Color.fromRGBO(223, 225, 230, 1), selected: true,
                    ).cPadSymmetric(h: 8),
                    ListTileItem(
                      name: 'Profile',
                      icon: profileIcon,
                      onTap: () {
                        HomeStackDashboardController.to.cameFromProfile = false;
                        HomeStackDashboardController.to.changeTabIndex(3);
                        Get.back();
                      },
                      iconColor: Color.fromRGBO(101, 101, 101, 1),
                      choosedColor:Colors.transparent, selected: false,
                    ).cPadSymmetric(h: 8),
                    ListTileItem(
                      name: 'Invoice',
                      icon: transactionIcon,
                      onTap: () {
                        HomeStackDashboardController.to.cameFromProfile = false;
                        HomeStackDashboardController.to.changeTabIndex(1);
                        Get.back();
                      },
                      iconColor: Color.fromRGBO(101, 101, 101, 1),
                      choosedColor:Colors.transparent,
                      selected: false,
                    ).cPadSymmetric(h: 8),
                    ListTileItem(
                      name: 'Students',
                      icon: studentsIcon,
                      onTap: () {
                        Get.back();
                        HomeStackDashboardController.to.cameFromProfile = false;
                        HomeStackDashboardController.to.changeTabIndex(2);
                      },
                      iconColor: Color.fromRGBO(101, 101, 101, 1),
                      choosedColor:Colors.transparent,
                      selected: false,
                    ).cPadSymmetric(h: 8),
                    ListTileItem(
                      name: 'Coupon',
                      icon: coupon_fill_icon,
                      onTap: () {
                        HomeStackDashboardController.to.cameFromProfile = false;
                        Get.back();
                        Get.toNamed(Routes.coupon);
                      },
                      iconColor: Color.fromRGBO(101, 101, 101, 1),
                      choosedColor:Colors.transparent,
                      selected: false,
                    ).cPadSymmetric(h: 8),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Color.fromRGBO(101, 101, 101, 1),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Policy',
                            style: customStyle(
                                17.0,
                                Colors.black,
                                FontWeight.normal))
                        .cPadOnly(l: 10),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTileItem(
                      name: 'Help&Support',
                      icon: contactUs,
                      onTap: () {
                        HomeStackDashboardController.to.cameFromProfile = false;
                        Get.back();
                        Get.toNamed(Routes.helpAndSupport);
                      },
                      iconColor: Color.fromRGBO(101, 101, 101, 1),
                      choosedColor:Colors.transparent,
                      selected: false,
                    ).cPadSymmetric(h: 8),
                    ListTileItem(
                      name: 'About Us',
                      icon: aboutUs,
                      onTap: () {
                        HomeStackDashboardController.to.cameFromProfile = false;
                        Get.back();
                        Get.toNamed(Routes.aboutUs);
                      },
                      iconColor: Color.fromRGBO(101, 101, 101, 1),
                      choosedColor:Colors.transparent,
                      selected: false,
                    ).cPadSymmetric(h: 8),
                    ListTileItem(
                      name: 'Privacy Policy',
                      icon: privacyPolicy,
                      onTap: () {
                        HomeStackDashboardController.to.cameFromProfile = false;
                        Get.back();
                        Get.toNamed(Routes.privacyPolicy);
                      },
                      iconColor: Color.fromRGBO(101, 101, 101, 1),
                      choosedColor:Colors.transparent,
                      selected: false,
                    ).cPadSymmetric(h: 8),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      color: Color.fromRGBO(101, 101, 101, 1),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ListTileItem(
                      name: 'Sign out',
                      icon: signOutIcon,
                      iconColor: Colors.red,
                      choosedColor:Colors.transparent,
                      selected: false,
                      textColor: const Color.fromRGBO(238, 36, 86, 1),
                      onTap: () {
                        showAlertPopup(context, onTapYes: () {
                          Get.back();
                          AppSession.to.logout();
                        }, onTapNo: () {
                          Get.back();
                        }, alertMessage: 'Are you sure you want to logout?');
                        // AppSession.to.logout();
                      },
                    ).cPadSymmetric(h: 8),
                  ],
                ).cPadOnly(l: 15),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ListTileItem extends StatelessWidget {
  var icon;
  var name;
  final Function onTap;
  final Color textColor;
  var iconColor;
  var choosedColor;
  var selected=false;

  ListTileItem({
    super.key,
    required this.icon,
    required this.name,
    required this.onTap,
    required this.iconColor,
    required this.choosedColor,
    required this.selected,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: selected,
      // selectedTileColor: Color.fromRGBO(71, 42, 138, 1),

      selectedColor: Color.fromRGBO(223, 225, 230, 1),
      visualDensity: const VisualDensity(vertical: -3),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      leading: SvgPicture.asset(
        icon,
        color: iconColor,
        width: 20,
        height: 20,
      ),
      title: Text(
        name,
        style: TextStyle(
            fontSize: 13, color: textColor, fontWeight: FontWeight.normal),
      ),
      onTap: () => onTap(),
    ).cPadOnly(b: 2, r: 10);
  }
}
