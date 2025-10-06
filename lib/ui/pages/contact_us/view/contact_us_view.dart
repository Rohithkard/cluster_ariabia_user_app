import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/contact_us/bind/contact_us_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: commonBackGroundColor,
      appBar: commonAppBarBack( 'Contact Us', primaryColorPurple,(){
        ContactUsController.to.onInit();
      }),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<ContactUsController>(
              builder: (logic) {
                return SingleChildScrollView(
                  child: Form(
                    key: logic.helpAndSupportFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register Your Complaints,Feedbacks',
                          style: customStyle(
                            16.0,
                            const Color.fromRGBO(5, 5, 0, .54),
                            FontWeight.normal,
                          ),
                        ).cPadOnly(t: 21),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          // width: 395,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(112, 112, 112, .22),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Center(
                            child:
                              CustomTextField(
                                onChanged: (v) {
                                  logic.helpAndSupportFormKey.currentState
                                      ?.validate();
                                },
                                hintText: 'Subject',
                                controller: logic.subject,
                                validator: (text) => valRequired(text!),
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(112, 112, 112, .22),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: CustomTextField(
                            height: 78,
                            maxLines: 5,
                            minLines: 1,
                            onChanged: (v) {
                              logic.helpAndSupportFormKey.currentState
                                  ?.validate();
                            },
                            hintText:
                            'Type your Complaints & Feedbacks & Enquiry',
                            // minLines: 5,
                            controller: logic.complaint,
                            validator: (text) => disvalRequired(text!),
                          ),
                        ).cPadOnly(b: 11),
                        Text(
                          'Contact Number',
                          style: customStyle(
                            11.0,
                            const Color.fromRGBO(5, 5, 0, .54),
                            FontWeight.normal,
                          ),
                        ).cPadOnly(b: 11),
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(112, 112, 112, .22),
                            ),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child:
                          Container(
                            height: 52,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              // color: const Color.fromRGBO(245, 245, 245, 1),
                                borderRadius: BorderRadius.circular(23)),
                            child: Row(
                              children: [
                                // Text(
                                //   '+974',
                                //   style: customStyle(15.0, Colors.black.withOpacity(0.38),
                                //       FontWeight.normal),
                                // ).cPadOnly(t: 5),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: TextFormField(
                                      enabled: false,
                                      // onChanged: onChanged,
                                      controller: logic.contactNumber,
                                      // validator: (text) => validateMobNumber(text!),
                                      // keyboardType: textInputType,
                                      // inputFormatters: textInputFormatter,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.only(
                                              top:
                                              // (AppSession.to.prefs.getString(SessionKeys.LANG_TYPE)
                                              //     == ''
                                              //         'en')
                                              //     ?0
                                              //     :
                                              5
                                          ),
                                          // suffixIcon: suffixIcon,
                                          border: InputBorder.none,
                                          // hintText: 'Contact Number',
                                          hintStyle: customStyle(
                                              15.0, Colors.black.withOpacity(0.82), FontWeight.normal))),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onTap: () {
                            logic.postHelpAndSupport();
                            // logic.complaint.clear();
                            // logic.subject.clear();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: primaryColorPurple,
                              borderRadius: BorderRadius.circular(103),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: customStyle(
                                  16.0,
                                  Colors.white,
                                  FontWeight.normal,
                                ),
                              ).cPadSymmetric(v: 16),
                            ),
                          ),
                        )
                      ],
                    ).cPadOnly(l: 20, r: 18,b: 10),
                  ),
                );
              },
            ),
          ],
        ),
      )
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     SizedBox(height: 10,),
      //     Text('Our Address',
      //       style: customStyle(16.0, Colors.black, FontWeight.bold),
      //     ).cPadAll(10.0),
      //     Text('123 Main Street,Apt 5B,Nob Hill,SanFrancisco,CA 94109',
      //       style: customStyle(14.0, Colors.black, FontWeight.normal),
      //     ).cPadAll(10.0),
      //     SizedBox(
      //       height: 10,
      //     ),
      //     Text('Contact Number :   9876543210',style: customStyle(15.0, Colors.black, FontWeight.normal)).cPadAll(10.0),
      //   ],
      // ),
    );
  }
}
