import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/login/bind/login_bind.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(65, 54, 133, 1),
          bottomNavigationBar: Container(
            height: 20,
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Powered By REPADTECH',
                  style: customStyle(
                      9.0, Colors.white, FontWeight.normal))
                  .cPadOnly(b: 10,
                // t:130
                        ),
              ],
            ),),
          // resizeToAvoidBottomInset: false,
          body: GetBuilder< LoginController>(builder: (logic) {
            return Form(
              key: logic.loginPageView,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: context.cWidth,
                  // height: context.cHeight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 500,
                            width: context.cWidth,
                            color: Colors.white,
                            child: Stack(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  racoLogo,
                                  width: 140,
                                ).cPadOnly(b: 100).cAlignment(Alignment.center),
                                AspectRatio(
                                  aspectRatio: 591 / 248,
                                  child: SvgPicture.asset(
                                    loginArchShape,
                                    width: double.maxFinite,
                                    height: (double.maxFinite) - 343,
                                  ),
                                ).cAlignment(Alignment.bottomCenter),
                                Text(
                                  'Welcome',
                                  style: customStyle(
                                      30.0, Colors.white, FontWeight.bold),
                                )
                                    .cAlignment(Alignment.bottomCenter)
                                    .cPadOnly(b: 20),
                              ],
                            ),
                          ),
                          Text(
                            'The perfect solution in Saudi Arabia for\n Effortless Mobility and Seamless Journeys.',
                            style: customStyle(
                                12.0,
                                const Color.fromRGBO(255, 255, 255, 0.8),
                                FontWeight.normal),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          if (logic.otpDesign.value == true)
                            Column(children: [
                              Container(
                                width: 250,
                                height: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.asset(
                                        contactNoImg,
                                        height: 20,
                                        width: 20,
                                      ).cToCenter,
                                    ).cPadOnly(l: 5),
                                    InkWell(
                                      onTap: () {
                                        if (WidgetsBinding.instance.window
                                                .viewInsets.bottom >
                                            0.0) {
                                          // Keyboard is visible.
                                          logic.keyBoardIsVisible.value = true;
                                          cLog('KEYBOARD Visible');
                                          logic.update();
                                        } else {
                                          logic.keyBoardIsVisible.value = false;
                                          logic.update();
                                          cLog('KEYBOARD UNVisible');
                                          // Keyboard is not visible.
                                        }
                                      },
                                      child: SizedBox(
                                        width: 200,
                                        child: TextFormField(
                                            maxLength: 10, // exactly 10 digits allowed
                                                style: customStyle(
                                                    17.0,
                                                    Colors.white,
                                                    FontWeight.normal),
                                                onChanged: (v) {
                                                  // logic.validateMobileNumbers(v);
                                                  logic.loginPageView
                                                      .currentState
                                                      ?.validate();
                                                },
                                                controller:
                                                    LoginController.to.mob,
                                                // validator: (text) =>
                                                //     validateLoginPage(
                                                //       value: text!),
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    counterText: '',
                                                    border: InputBorder.none,
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            bottom: 5),
                                                    hintText: 'Enter Mobile Number',
                                                    hintStyle: customStyle(
                                                        14.0,
                                                        Colors.white,
                                                        FontWeight.normal)))
                                            .cPadOnly(l: 10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // logic.validator: (text) => validateMobileNumber(text!),
                                  Text(
                                    logic.errorMessage,
                                    style: customStyle(
                                        12.0, Colors.red, FontWeight.normal),
                                  ).cPadOnly(t: 4, r: 10),
                                ],
                              ).cVisible((logic.validatorNumber.value)),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () {
      
                                  logic.checkLogin(
                                    context:context,
                                  );
                                },
                                child: Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text('Login',
                                          style: customStyle(
                                              15.0,
                                              primaryColorPurple,
                                              FontWeight.bold))
                                      .cToCenter,
                                ).cHero('Login button'),
                              ),
                            ]),
                          if (logic.otpDesign.value != true)
                            Column(children: [
                              OTPTextField(
                                length: 4,
                                controller: logic.otpFieldController,
                                width: 250,
                                // width: MediaQuery.of(context).size.width,
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                spaceBetween: 10,
                                otpFieldStyle: OtpFieldStyle(
                                  backgroundColor: Colors.transparent,
                                  enabledBorderColor: Colors.white,
                                ),
                                fieldWidth: 50,
                                fieldStyle: FieldStyle.box,
                                outlineBorderRadius: 12,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.white),
                                onCompleted: (pin) {
                                  logic.otp.value = pin;
                                  logic.verifyOtp(
                                    context:context,
                                  );
                                },
                              )
                                  .cAlignment(Alignment.center)
                                  .cPadOnly(l: 10, r: 10),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          'Did\'t received the code ${logic.mob.text}',
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  255, 255, 255, 0.6),
                                              fontSize: 9)),
                                      // Directionality(
                                      //   textDirection: TextDirection.ltr,
                                      //   child: Text(' ${logic.dataIsMobileEmail.value}',
                                      //       style: const TextStyle(
                                      //           color: Color.fromRGBO(255, 255, 255, 0.6),
                                      //           fontSize: 14)),
                                      // ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      logic.otpDesign.value =
                                          !logic.otpDesign.value;
                                      logic.update();
                                    },
                                    child: Text(
                                      'Change',
                                      style: defaultUnderLine,
                                      // TextStyle(
                                      //     color: Color.fromRGBO(84, 193, 251, 1),
                                      //     fontSize: 14,),
                                    ),
                                  )
                                ],
                              ).cPadOnly(l: 5),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  //
                                  logic.verifyOtp(
                                    context:context,
                                  );
                                },
                                child: Container(
                                  width: 250,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text('Verify',
                                          style: customStyle(
                                              15.0,
                                              primaryColorPurple,
                                              FontWeight.bold))
                                      .cToCenter,
                                ).cHero('Login button'),
                              )
                            ])
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
