import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

showLoading() {
  EasyLoading.show();
}

dismissLoading() {
  EasyLoading.dismiss();
}

showToast({required BuildContext context, required var message}) {
  // EasyLoading.showToast(message);
  toastification.show(
    context: context, // optional if you use ToastificationWrapper
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 5),
  );
}

void copyToClipboard(String value) {
  Clipboard.setData(ClipboardData(text: value));
  EasyLoading.showToast('Copied');
  // showToast(context: context, message: 'Copied');
}

String getShortMonthText(int monthNumber) {
  // Create a new date with the month number
  DateTime date = DateTime(2020, monthNumber); // The year can be any year
  // Format the date to get the short month name
  return DateFormat.MMM().format(date); // 'MMM' gives the short month name
}

validateLoginPage({var value}) {
  if (value == null || value.isEmpty) {
    return 'Please enter some text';
  }
  // Check if the value contains an '@' symbol which is typical for emails
  // if (value.contains('@')) {
    // Regular expression to validate an email
    String pattern = r'\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
  // } else {
  //   // Regular expression to validate a mobile number
  //   String pattern = r'(^[0-9]{10}$)';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     return 'Enter a valid mobile number';
  //   }
  // }
  return null;
}

String? valRequired(text, ) {
  if ((text ?? '').isEmpty) {
    return 'Please enter the subject of your complaint here';
  }
  return null;
}
String? disvalRequired(text,) {
  if ((text ?? '').isEmpty) {
    return 'Please enter your complaints here';
  }
  return null;
}

String? validateMobNumber(String value) {
  // Remove any non-digit characters
  String mobileNumber = value.replaceAll(RegExp(r'[^0-9]'), '');

  if (mobileNumber.length == 10 || mobileNumber.length == 14) {
    return null; // Validation passed
    // ignore: unnecessary_null_comparison
  } else if (value == null || value.isEmpty) {
    return 'Please enter mobile number';
  } else {
    return 'Mobile number must be 10 or 14 digits long';
  }
}

void makePhoneCall({required String phoneNumber}) async {
  final String url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
openUrl(String urlLink,{bool? isPay=true}) async {
    // if (await canLaunch(urlLink)) {
    //   await launch(urlLink);
    // } else {
    //   throw 'Could not launch $urlLink';
    // }
  Get.toNamed(Routes.toPaymentRoute,arguments: [urlLink,isPay]);//Pass `true` to pay the bill and `false` to view the bill.
  }

  bool isDateExpired(String dateString) {
  // Parse the string date into a DateTime object
  DateTime parsedDate = DateTime.parse(dateString);

  // Get the current date and time
  DateTime currentDate = DateTime.now().toUtc();

  // Compare the parsed date with the current date
  return parsedDate.isBefore(currentDate);
}
