import 'package:cluster_arabia/res/animation.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/help&support/bind/help&support_bind.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class HelpList extends StatelessWidget {
  const HelpList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HelpAndSupportController>(
        builder: (logic) {
          return SingleChildScrollView(
            controller: logic.scrollController,
            child: Column(children: [
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: logic.helpAndSupportLists.length,
                  shrinkWrap: true,
                  itemBuilder: (context,i) {
                    var data=logic.helpAndSupportLists[i];
                    return InkWell(
                      onTap: (){
                        data.id??'';
                        logic.subject = data.subject??'';
                        logic.complaint = data.content??'';
                        logic.reply = data.replay??'';
                        helpPopup(context: context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 12),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        // height: 135,
                        width: context.cWidth,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          // color: Color.fromRGBO(240, 243, 253, 1),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 1,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            ),
                          ],
                          // border: Border.all(color: Colors.black54, width: 0.2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.subject??'',style: customStyle(15.0, Colors.black, FontWeight.bold),),
                            SizedBox(
                                width: 120,
                                child: Text(
                                  data.content??'',
                                  overflow: TextOverflow.ellipsis,style: customStyle(12.0, Colors.black, FontWeight.normal),).cPadOnly(t: 8)),
                            Text((data.createdAt??'').cDateToAging()).cPadOnly(t: 10).cAlignment(Alignment.bottomRight)
                          ],),
                      ),
                    );
                  }
              )
              // FirstPart(),
              // BottomPart()
            ],).cPadAll(15),
          );
        }
    );
  }
}


void helpPopup({
  required BuildContext context,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        // alignment: Alignment.topRight,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: GetBuilder<HelpAndSupportController>(builder: (logic) {
            return Container(
              // height: 500,
              width: 330,
              padding: const EdgeInsets.only(top: 1, bottom: 10),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 1, // blur radius
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          // logic.clearVariable();
                          Get.back();
                        },
                        iconSize: 20,
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        )).cAlignment(Alignment.topRight),
                    const Divider().cPadZero,
                    RichText(
                      text: TextSpan(
                        text: '',
                        // style: TextStyle(fontSize:12,fontWeight: FontWeight.bold),
                        style: DefaultTextStyle.of(context).style,
                        children:  <TextSpan>[
                          const TextSpan(text: 'Subject : ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${logic.subject }', style: const TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                   // Text('Subject : ${logic.subject }'),
                   const SizedBox(height: 10,),
                    RichText(
                      text: TextSpan(
                        text: '',
                        // style: TextStyle(fontSize:12,fontWeight: FontWeight.bold),
                        style: DefaultTextStyle.of(context).style,
                        children:  <TextSpan>[
                          const TextSpan(text: 'Complaint : ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${logic.complaint }', style: const TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                   // Text('Complaint : ${logic.complaint }'),
                    const SizedBox(height: 10,),
                    RichText(
                      text: TextSpan(
                        text: '',
                        // style: TextStyle(fontSize:12,fontWeight: FontWeight.bold),
                        style: DefaultTextStyle.of(context).style,
                        children:  <TextSpan>[
                          const TextSpan(text: 'Reply : ', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: '${logic.reply }', style: const TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    // Text('Reply : ${logic.reply }'),
                    // const Divider().cPadZero,
                    // InkWell(
                    //   onTap: () {
                    //     Get.back();
                    //   },
                    //   child: Text(
                    //     'Close',
                    //     style: customStyle(12.0, Colors.black, FontWeight.w700),
                    //   ).cPadOnly(r: 15).cAlignment(Alignment.bottomRight),
                    // )
                  ]).cPadAll(10),
            );
          }),
        ),
      );
          // .cPadOnly(r: 50, t: 50);
    },
  );
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Get.toNamed(Routes.contactUs);
      },
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          // color: primaryColorPurple,
          //   border: Border.all(
          //       color: Colors.black),
          color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius:
            BorderRadius.circular(
                4)),
        child: Lottie.asset(contactusLottie,),
      ),
    ).cPadOnly(b: 20,r: 10);
  }
}



