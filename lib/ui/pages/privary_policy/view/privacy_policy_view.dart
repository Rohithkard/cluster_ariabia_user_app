import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: commonBackGroundColor,
      appBar: commonAppBarBack('Privacy Policy', primaryColorPurple,(){}),
      body: Column(children: [
        ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context,i) {
              return const Text('"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."',textAlign: TextAlign.justify,).cPadOnly(t: 10,l: 15,r: 15);
            }
        )
      ],),
    );
  }
}
