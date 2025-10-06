import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

AppBar commonAppBarBack(String titleName, var bColor, VoidCallback? onTap) {
  return AppBar(
    backgroundColor: bColor,
    elevation: 0,
    titleSpacing: 0,
    centerTitle: true,
    leading: InkWell(
      onTap: () {
        final controller = HomeStackDashboardController.to;

        if (controller.cameFromProfile) {
          // Navigate back to Profile (index 3) if it came from Profile
          controller.changeTabIndex(3);
        } else {
          // Otherwise, go back to Home (index 0)
          controller.changeTabIndex(0);
        }

        controller.cameFromProfile = false;

        Get.back(); // Close the current page or drawer
      },
      child: const Icon(
        Icons.arrow_back_ios_outlined,
        color: Colors.white,
      ),
    ),
    title: Text(
      titleName,
      style: customStyle(
        18.0,
        Colors.white,
        FontWeight.bold,
      ),
    ),
    actions: [
      InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            clearUpdateIcon,
            height: 20,
            width: 20,
          ).cPadOnly(r: 15)),
    ],
  );
}

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onClear;
  final String buttonTitle;
  final TextStyle? titleStyle;
  final bool showIcon;

  final bool showClear;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color borderColor;
  final Color? backgroundColor;
  final double radius;
  final double vPadding;
  final double width;

  const CustomButtonWidget({
    super.key,
    this.onTap,
    this.onClear,
    this.buttonTitle = 'Click Here', // Corrected typo
    this.radius = 5,
    this.vPadding = 10,
    this.width = 100,
    this.titleStyle = const TextStyle(
        color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.normal),
    this.showIcon = false,
    this.showClear = false,
    this.icon = Icons.print,
    this.iconSize = 25,
    this.iconColor = Colors.white,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: vPadding),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: borderColor,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTap,
            child: Wrap(
              alignment: WrapAlignment
                  .center, // Aligns the children in the center like MainAxisAlignment.center in Row
              crossAxisAlignment: WrapCrossAlignment
                  .center, // Aligns children in the cross axis in the center
              spacing:
                  0, // Adjust if you want any horizontal space between the children
              runSpacing:
                  0, // Adjust if you want any vertical space between the lines
              children: [
                Text(
                  buttonTitle,
                  style: titleStyle,
                ),
                if (showIcon)
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    ),
                  ),
              ],
            ),
          ).cExpanded(1),
          if (showClear)
            GestureDetector(
                onTap: onClear,
                child: Icon(icon, size: iconSize, color: iconColor))
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final int? minLines;
  final int? maxLines;
  final double? height;
  void Function()? onTap;
  TextEditingController? controller;
  Widget? suffixIcon;
  TextInputType? textInputType;
  List<TextInputFormatter>? textInputFormatter;
  String hintText;
  String? Function(String?)? validator;
  void Function(String)? onChanged; // Add onChanged callback

  CustomTextField({
    super.key,
    this.minLines = 1,
    this.maxLines = 1,
    this.height = 52,
    this.onTap,
    this.controller,
    this.textInputType,
    this.textInputFormatter,
    this.suffixIcon,
    this.validator,
    this.hintText = '',
    this.onChanged, // Initialize the onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
      ),
      child: TextFormField(
        // minLines: 1,
        // maxLines: 5,
        // maxLength: 500,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        onChanged: onChanged, // Set the onChanged callback here
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 10),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: customStyle(
              15.0, Colors.black.withOpacity(0.4), FontWeight.normal),
        ),
      ).cPadOnly(b: 5),
    );
  }
}

class CustomRoundedCheckBox extends StatelessWidget {
  void Function()? onTap;
  final v;

  CustomRoundedCheckBox({super.key, this.onTap, this.v});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: v ? primaryColorPurple : Colors.white,
          border: Border.all(
            color: v
                ? primaryColorPurple
                : Colors.grey.withOpacity(0.8), // White border color
            width: 1.5,
          ),
          // borderRadius:
          //     BorderRadius.circular(4.0), // Adjust the border radius as needed
        ),
        child: v
            ? const Icon(
                Icons.check,
                color: Colors.white,
                size: 13.0,
              )
            : const SizedBox(), // Empty SizedBox when not checked
      ),
    );
  }
}

showAlertPopup(context,
    {void Function()? onTapYes,
    void Function()? onTapNo,
    var alertMessage = 'message',
    // var alertImage = emoji
    var alertImage = emoji}) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 10, //spread radius
                    blurRadius: 18, // blur radius
                    offset: const Offset(0, 2), // changes position of shadow
                    //first parameter of offset is left-right
                    //second parameter is top to down
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  alertImage,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(height: 26),
                Text(alertMessage),
                const SizedBox(height: 26),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: onTapNo,
                        child: Container(
                            height: 32,
                            width: 140,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(188, 188, 188, 1),
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text(
                                "No",
                                style: customStyle(
                                    14.0, Colors.white, FontWeight.normal),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: onTapYes,
                        child: Container(
                            height: 32,
                            width: 140,
                            decoration: BoxDecoration(
                                color: primaryColorPurple,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text(
                                "Yes",
                                style: customStyle(
                                    14.0, Colors.white, FontWeight.normal),
                              ),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
