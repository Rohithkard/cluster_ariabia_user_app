
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/bind/children_innerpage_bind.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/view/children_innerPage_more.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class ChildrenInnerPage extends StatelessWidget {
  const ChildrenInnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    ChildrenInnerPageController.to.context=context;
    return Scaffold(
      backgroundColor: commonBackGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const ProfilePart(),
          const AddressPart(),
            const SchoolDetails(),
            Row(
              children: [
                const PickupPointSection().cExpanded(1),
                const SizedBox(width: 15,),
              ],
            ),
            const BusDetails(),
            const OtherInfo()
        ],).cPadOnly(l: 15,r: 15,t: 10,b: 10),
      ),
    );
  }
}
