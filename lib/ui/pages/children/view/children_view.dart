import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/ui/pages/children/view/children_more.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class ChildrenView extends StatelessWidget {
  const ChildrenView({super.key});

  @override
  Widget build(BuildContext context) {
    ChildrenController.to.context = context;
    return WillPopScope(
      onWillPop: () async {
        HomeStackDashboardController.to.changeTabIndex(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: commonBackGroundColor,
        appBar: commonAppBarBack('Students', primaryColorPurple,(){
          ChildrenController.to.onInit();
        }),
        body: GetBuilder<ChildrenController>(
          builder: (logic) {
            return SingleChildScrollView(
              controller: logic.scrollController,
              child: const Column(
                children: [SearchPart(), SelectionButton(), ListPart()],
              ).cPadAll(10),
            );
          }
        ),
      ),
    );
  }
}
