import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/help&support/bind/help&support_bind.dart';
import 'package:cluster_arabia/ui/pages/help&support/view/help&support_more.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: commonBackGroundColor,
      floatingActionButton:  const Contact(),
      appBar: commonAppBarBack('Help and Support', primaryColorPurple, () {
        HelpAndSupportController.to.onInit();
      }),
      body: const HelpList()
    );
  }
}
