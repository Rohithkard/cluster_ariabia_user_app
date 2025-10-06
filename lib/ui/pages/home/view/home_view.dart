import 'package:cluster_arabia/main.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_more.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController.to.context = context;
    return GetBuilder<HomeController>(builder: (logic) {
      return Scaffold(
        backgroundColor: commonBackGroundColor,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: primaryColorPurple,
          elevation: 0,
          leading: IconButton(
            icon: CircleAvatar(
              radius: 40, // Image radius
              backgroundImage:
                  NetworkImage(logic.profileModel?.data?.img ?? ''),
            ),
            onPressed: () {
              HomeStackDashboardController.to.scaffoldKey.currentState
                  ?.openDrawer();
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                logic.profileModel?.data?.name ?? '',
                style: customStyle(16.0, Colors.white, FontWeight.bold),
              ),
              Text(
                logic.profileModel?.data?.email ?? '',
                style: customStyle(12.0, Colors.white, FontWeight.normal),
              ),
            ],
          ),
          actions: [

          ],
        ),
        // drawer: const HomeDrawer(),
        // key: HomeController.to.scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FirstPart(),
              if ((logic.sliderModel?.data ?? []).isNotEmpty)
              const BannerSection(),
              const MainMenu(),
               if ((logic.invoiceList ?? []).isNotEmpty)
               BillOverView().cPadOnly(t:10),
              const BottomImageList()
            ],
          ),
        ),
      );
    });
  }
}
