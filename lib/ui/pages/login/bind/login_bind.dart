import 'package:cluster_arabia/models/login_model.dart';
import 'package:cluster_arabia/models/otp_verify_model.dart';
import 'package:cluster_arabia/res/animation.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/utilities/api_provider.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/com_binding.dart';
import 'package:cluster_arabia/utilities/strings.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:otp_text_field/otp_text_field.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  var loginPageView = GlobalKey<FormState>();
  late BuildContext context;
  LoginModel? loginModel;
  OtpModelClass? otpModelClass;
  var otp = ''.obs;
  var otpDesign = true.obs;
  var keyBoardIsVisible = false.obs;
  var validatorNumber = false.obs;
  var errorMessage = '';
  var otpInteractor;

  OtpFieldController otpFieldController = OtpFieldController();
  late OTPTextEditController controller;
  var mob = TextEditingController();

  @override
  void onInit() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    otpInteractor = OTPInteractor();
    otpInteractor.getAppSignature().then((value) {
      // if (kDebugMode) {
      //   // print('signature - $value');
      // }
    });
    controller = OTPTextEditController(
      codeLength: 5,
      //ignore: avoid_print
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: otpInteractor,
    )..startListenUserConsent(
        (code) {
          var otpIs = code?.replaceAll(RegExp('[a-zA-Z , .:\s]'), "").trim();
          otp.value = otpIs ?? '';
          otpFieldController.setValue((otpIs ?? '')[0], 0);
          otpFieldController.setValue((otpIs ?? '')[1], 1);
          otpFieldController.setValue((otpIs ?? '')[2], 2);
          otpFieldController.setValue((otpIs ?? '')[3], 3);
          verifyOtp(context: context);
          return code ?? '';
        },
      );
    super.onInit();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  void checkLogin({required BuildContext context}) async {
    if (loginPageView.currentState?.validate() ?? false) {
      try {
        showLoading();
        loginModel = await Api.to.userLogin(phone: mob.text);
        dismissLoading();
        if (loginModel?.success ?? true) {
          otpDesign.value = !otpDesign.value;
          // otp.value = loginModel?.data?.otp ?? '';

          // 1.cDelay(() {
          //   var otpValue = loginModel?.data?.otp ?? ''; //
          //   otpFieldController.setValue(otpValue[0], 0);
          //   otpFieldController.setValue(otpValue[1], 1);
          //   otpFieldController.setValue(otpValue[2], 2);
          //   otpFieldController.setValue(otpValue[3], 3);
          //   update();
          // });
        } else {
          if ((loginModel?.message ?? '').contains('not found')) {
            showExitPopup(context);
          } else {
            showToast(context: context, message: loginModel?.message ?? '');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print('Exception : $e');
        }
      } finally {
        update();
      }
    }
  }

  void verifyOtp({required BuildContext context}) async {
    try {
      showLoading();
      otpModelClass = await Api.to.otpVerifyOtp(
        otpToken: loginModel?.data?.otpToken ?? '',
        otp: otp.value,
      );
      dismissLoading();
      if (otpModelClass?.success ?? false) {
        AppSession.to.session
            .write(SessionKeys.API_KEY, otpModelClass?.data?.token ?? '');
        Get.offAllNamed(Routes.homeStackDashboard);
      } else {
        showToast(context: context, message: otpModelClass?.message ?? '');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception : $e');
      }
    } finally {
      update();
    }
  }
}

showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 200,
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
            child: GetBuilder<LoginController>(builder: (logic) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   searchemoji,
                  //   height: 66,
                  //   width: 66,
                  // ),
                  Lottie.asset(
                    exclamation,
                    height: 106,
                    width: 106,
                  ),
                  // const SizedBox(height: 26),
                  Text(
                    'Please ensure your number is valid. Invalid numbers are not allowed here.',
                    style: customStyle(13.0, Colors.black, FontWeight.normal),
                  ).cPadOnly(l: 10),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                          // Get.toNamed(Routes.signUp,
                          //     arguments: [logic.mob.text]);
                        },
                        child: Container(
                            height: 32,
                            width: 80,
                            decoration: BoxDecoration(
                                // color: const Color.fromRGBO(188, 188, 188, 1),
                                color: primaryColorPurple,
                                borderRadius: BorderRadius.circular(32)),
                            child: Center(
                              child: Text(
                                'Ok',
                                style: customStyle(
                                    14.0, Colors.white, FontWeight.normal),
                              ),
                            )),
                      ),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      // Expanded(
                      //   child: InkWell(
                      //     onTap: () {
                      //       Get.back();
                      //       // Get.toNamed(Routes.signUp,
                      //       //     arguments: [logic.mob.text]);
                      //     },
                      //     child: Container(
                      //         height: 32,
                      //         width: 140,
                      //         decoration: BoxDecoration(
                      //           // color: const Color.fromRGBO(188, 188, 188, 1),
                      //             color: Colors.blue,
                      //             borderRadius: BorderRadius.circular(32)),
                      //         child: Center(
                      //           child: Text(
                      //             "yes".tr,
                      //             style: customStyle(
                      //                 14.0, Colors.white, FontWeight.normal),
                      //           ),
                      //         )),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              );
            }),
          ),
        );
      });
}
