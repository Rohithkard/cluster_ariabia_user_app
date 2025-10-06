import 'package:cluster_arabia/res/animation.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/coupon/bind/coupon_bind.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CouponList extends StatelessWidget {
  const CouponList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponController>(builder: (logic) {
      return SingleChildScrollView(
        controller: logic.scrollController,
        child: Column(
          children: [
            GridView.builder(
                itemCount: logic.couponLists.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: cGetResGridRatio(
                    context: context,
                    height: 210,
                    width: 190,
                  ),
                  crossAxisCount: cGetResCrossCountGrid(
                    context: context,
                    width: 187,
                  ),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) {
                  var data = logic.couponLists[index];
                  return Container(
                      padding: const EdgeInsets.all(5),
                      width: double.maxFinite,
                      // width: (context.cWidth < 700) ? 140 : 160,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 6,
                              spreadRadius: 1,
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                            )
                            // BoxShadow(
                            //     color: Color.fromRGBO(
                            //         0, 0, 0, 0.15),
                            //     blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.circular(7)),
                      child:
                          // (!(couponList.isScratchedByYou ??
                          //     true))
                          //     ?
                          // Container(
                          //   color: checkDateBeetWeen(
                          //       DateTime.parse(
                          //           '${logic.couponList?[index]?.expDate ?? '10/09/2020'}'),
                          //       DateTime.now())
                          //   // ? Colors.blue[200]
                          //       ? Colors.blue[200]
                          //       : Colors.blue,
                          //   width: 130,
                          //   height: 135,
                          // )
                          //     :
                          Container(
                        width: 130,
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 6,
                                spreadRadius: 1,
                                color: Color.fromRGBO(0, 0, 0, 0.25),
                              )
                            ],
                            borderRadius: BorderRadius.circular(7)),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                  width: 180,
                                  // color: Colors.green,
                                  child: Align(
                                    child: Lottie.asset(
                                      couponLottie,
                                      height: 100,
                                    ),
                                  )),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text(
                                    'You\'ve get a gift',
                                    style: customStyle(
                                        14.0, Colors.black, FontWeight.normal),
                                  ).cPadOnly(t: 18),
                                  Text(
                                    'Exp: ${(data.endDate ?? '').cGetFormattedDate(format: 'dd-MMM-yyyy')}',
                                    style: customStyle(
                                        10.0, Colors.black, FontWeight.normal),
                                  ),
                                  Text(
                                    '${data.value ?? ' '}'.cToCurrencyIND,
                                    // '${'qrText'.tr}: ${textToCopy}',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ).cPadOnly(t: 3),
                                  ((data.isCouponUsed ?? false))
                                      ? Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("Gift applied",
                                                  style: customStyle(
                                                      16.0,
                                                      Colors.white,
                                                      FontWeight.bold)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Icon(
                                                Icons.check,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ).cPadOnly(t: 7, l: 8, r: 8)
                                      : ((isDateExpired(data.endDate ?? "")))
                                          ? Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              height: 35,
                                              decoration: BoxDecoration(
                                                // color: Color.fromRGBO(242, 250, 251, 1)
                                                color: Colors.grey.shade400
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: const Center(
                                                child: Text("Expired",
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black87)),
                                              ),
                                            ).cPadOnly(t: 7, l: 8, r: 8)
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              height: 35,
                                              decoration: BoxDecoration(
                                                // color: Color.fromRGBO(242, 250, 251, 1)
                                                color: Colors.grey.shade400
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                      width: 90,
                                                      child: Text(
                                                        // 'h67ui9kjg9',
                                                        '${data.couponCode}',
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black87),
                                                      )
                                                      // .cPadOnly(
                                                      // l: 10),
                                                      ),
                                                  InkWell(
                                                    onTap: () {
                                                      copyToClipboard(
                                                          '${data.couponCode}');
                                                    },
                                                    child: const Icon(
                                                      Icons.copy,
                                                      size: 20,
                                                      color: Colors.black87,
                                                    ),
                                                  )
                                                  // .cPadOnly(r: 10)
                                                ],
                                              ),
                                            ).cPadOnly(t: 7, l: 8, r: 8),
                                ],
                              ),
                            )
                          ],
                        ),
                      )).cClipAll(7).cOpacity((isDateExpired(
                              data.endDate ?? "") &&
                          !(data.isCouponUsed ?? false))
                      ? 0.5
                      : 1);
                }).cPadAll(10),
          ],
        ),
      );
    });
  }
}
