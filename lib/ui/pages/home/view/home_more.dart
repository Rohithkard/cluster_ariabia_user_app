// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:cluster_arabia/utilities/dio.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Stack(
        children: [
          Container(
            height: 118,
            width: context.cWidth,
            decoration: BoxDecoration(
                color: primaryColorPurple,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total payable amount',
                      style: customStyle(14.0, Colors.white, FontWeight.normal),
                    ),
                    Text(
                      '${logic.totalAmount / 100}',
                      // 'SAR ${double.parse('${logic.homeBillAmount?.data?.totalPayableAmount ?? '0.0'}') / 100}',
                      style: customStyle(20.0, Colors.white, FontWeight.bold),
                    ),
                  ],
                ),
                Positioned(
                  right: 60,
                  child: CachedNetworkImage(
                    imageUrl:
                        logic.studentModelList?.data?.dataList?.cFirst?.img ??
                            '',
                    // placeholder: (context, url) =>
                    //     const CircularProgressIndicator(),
                    width: 40,
                    height: 40,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ).cClipAll(40),
                ).cVisible(
                    ((logic.studentModelList?.data?.dataList?.cFirst?.img ??
                            ''))
                        .isNotEmpty),
                Positioned(
                  right: 35,
                  child: CachedNetworkImage(
                    imageUrl:
                        ((logic.studentModelList?.data?.dataList?.length ?? 0) >
                                1)
                            ? ((logic.studentModelList?.data?.dataList?[1])
                                    ?.img ??
                                '')
                            : '',
                    // placeholder: (context, url) =>
                    //     const CircularProgressIndicator(),
                    width: 40,
                    height: 40,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ).cClipAll(40),
                ).cVisible((((logic.studentModelList?.data?.dataList?.length ??
                                0) >=
                            2)
                        ? ((logic.studentModelList?.data?.dataList?[1])?.img ??
                            '')
                        : '')
                    .isNotEmpty),
                Positioned(
                  right: 10,
                  child: CachedNetworkImage(
                    imageUrl: ((logic
                                    .studentModelList?.data?.dataList?.length ??
                                0) >=
                            3)
                        ? ((logic.studentModelList?.data?.dataList?[2])?.img ??
                            '')
                        : '',
                    // placeholder: (context, url) =>
                    //     const CircularProgressIndicator(),
                    width: 40,
                    height: 40,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.account_circle_rounded),
                  ).cClipAll(40),
                ).cVisible((((logic.studentModelList?.data?.dataList?.length ??
                                0) >=
                            3)
                        ? ((logic.studentModelList?.data?.dataList?[2])?.img ??
                            '')
                        : '')
                    .isNotEmpty),
              ],
            ).cPadOnly(t: 10, l: 40, r: 15),
          ),
          if ((logic.invoiceListModel?.data?.dataList ?? []).isNotEmpty)
            SizedBox(
              width: context.cWidth,
              height: 70,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      logic.invoiceListModel?.data?.dataList?.length ?? 0,
                  itemBuilder: (cnt, i) {
                    var data = logic.invoiceListModel?.data?.dataList?[i];
                    return ChildBox(
                      no: '${i + 1}',
                      price: ((double.parse('${data?.amount ?? '0'}') +
                              double.parse('${data?.taxAmount ?? '0'}')) /
                          100),
                      month: (data?.billedOn ?? '')
                          .cGetFormattedDate(format: 'MMM yyyy'),
                      profileImg: (data?.img),
                      name: data?.student?.name ?? '',
                    ).cPadOnly(l: (i == 0) ? 30 : 15);
                  }),
            ).cPadOnly(
              t: 72,
            ),
        ],
      );
    });
  }
}

class ChildBox extends StatelessWidget {
  final String no;
  var price;
  var month;
  var profileImg;
  var name;

  ChildBox({
    super.key,
    required this.no,
    required this.price,
    required this.month,
    required this.profileImg,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 120,
      height: 70,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(15),
          // boxShadow: const [
          //   BoxShadow(
          //     blurRadius: 5,
          //     spreadRadius: 1,
          //     color: Color.fromRGBO(0, 0, 0, 0.25),
          //   ),
          // ],
          border: Border.all(color: Colors.black, width: 0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      name,
                      style: customStyle(10.0, Colors.black, FontWeight.bold),
                    ),
                  ),
                  Text(
                    month,
                    style: customStyle(
                        9.0,
                        const Color.fromRGBO(83, 100, 133, 1),
                        FontWeight.normal),
                  )
                ],
              ),
              const SizedBox(
                width: 4,
              ),
              CachedNetworkImage(
                imageUrl: profileImg ?? '',
                width: 35,
                height: 30,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.account_circle_rounded),
              )
            ],
          ),
          SizedBox(
            width: 110,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('SAR ${price}',
                        style: customStyle(12.0, Colors.blue, FontWeight.bold))
                    .cPadOnly(t: 5),
              ],
            ),
          )
        ],
      ).cPadOnly(r: 8, l: 8, t: 5, b: 5),
    );
  }
}

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Stack(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 1.96,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
            itemCount: logic.sliderModel?.data?.length ?? 0,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: NetworkImage(
                        logic.sliderModel?.data?[itemIndex].img ?? ''),
                    fit: BoxFit.fill,
                  )),
            ),
          ).cPadOnly(t: 10, b: 10),
        ],
      );
    });
  }
}

class BillOverView extends StatelessWidget {
  const BillOverView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Container(
        // height: 135,
        width: context.cWidth,
        decoration: BoxDecoration(
          color: commonBackGroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Bills Dues',
                // 'Overview of Billing for ${(logic.startDatePass.cGetFormattedDate(format: 'MMM-yyyy'))}',
                style: customStyle(16.0, Colors.black, FontWeight.bold)),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                itemCount: logic.invoiceList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  var data = logic.invoiceList[i];
                  return TransactionItem(
                    studentName: (data.student?.name ?? ''),
                    studentClass:
                        ('${data.student?.std ?? ''} (${data.student?.division ?? ''})'),
                    billMonth: (data.billedOn ?? '')
                        .cGetFormattedDate(format: 'MMM yyyy'),
                    amount:
                        ('${(double.parse('${data.amount ?? 0}') + double.parse('${data.taxAmount ?? 0}')) / 100}'),
                    onclick: () {
                      logic.couponModel = null;
                      logic.couponCodePass = '';
                      logic.couponCode.clear();
                      payBillPopup(
                          context: context,
                          billedOn: (data.billedOn ?? '')
                              .cGetFormattedDate(format: 'MMM yyyy'),
                          studentName: data.student?.name ?? '',
                          invoiceNo: data.totalBillAmountData?.id ?? '',
                          totalAmount:
                              ((data.amount ?? 0) / 100).toStringAsFixed(2),
                          tax:
                              ((data.taxAmount ?? 0) / 100).toStringAsFixed(2));
                    },
                  ).cPadOnly(t: (i == 0) ? 0 : 10);
                }),
            const SizedBox(
              height: 8,
            ),
          ],
        ).cPadOnly(l: 10, r: 10, t: 10),
      );
    });
  }
}

class TransactionItem extends StatelessWidget {
  var studentName;

  var studentClass;

  var billMonth;

  var amount;

  var onclick;

  TransactionItem({
    super.key,
    required this.studentName,
    required this.studentClass,
    required this.billMonth,
    required this.amount,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: context.cWidth,
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey, // shadow color with opacity
              spreadRadius: 1, // the spread radius of the shadow
              blurRadius: 10, // how soft the shadow is
              offset:
                  Offset(0, 3), // horizontal and vertical offset of the shadow
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 180,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    studentName,
                    style: customStyle(13.0, Colors.black, FontWeight.bold),
                  ),
                ),
                Text(
                  studentClass,
                  style: customStyle(12.0, Colors.black, FontWeight.normal),
                ),
                Text(
                  billMonth,
                  style: customStyle(12.0, Colors.black, FontWeight.normal),
                )
              ],
            ),
            Row(
              children: [
                const VerticalDivider(
                  width: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SAR',
                      style: customStyle(12.0, Colors.blue, FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      amount,
                      style: customStyle(16.0, Colors.blue, FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: onclick,
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: primaryColorPurple,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Text(
                        'Pay Now',
                        style: customStyle(12.0, Colors.white, FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ).cPadAll(10.0),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                // Get.toNamed(Routes.children);
                HomeStackDashboardController.to.changeTabIndex(2);
              },
              child: MenuBox(
                text: 'Students',
                img: studentsIcon,
                backgroundColor: Color.fromRGBO(225, 223, 255, 1),
              ),
            ).cExpanded(1),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                HomeStackDashboardController.to.changeTabIndex(1);
              },
              child: MenuBox(
                text: 'Invoice',
                img: transactionIcon,
                backgroundColor: Color.fromRGBO(208, 255, 231, 1),
              ),
            ).cExpanded(1),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                HomeStackDashboardController.to.changeTabIndex(3);
              },
              child: MenuBox(
                text: 'Profile',
                img: profileIcon,
                backgroundColor: Color.fromRGBO(255, 233, 229, 1),
              ),
            ).cExpanded(1),
          ],
        ).cPadOnly(l: 10, r: 10, t: 5)
      ],
    );
  }
}

void payBillPopup({
  required BuildContext context,
  String invoiceNo = '',
  String totalAmount = '',
  String tax = '',
  String studentName = '',
  String billedOn = '',
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: GetBuilder<HomeController>(builder: (logic) {
            return Container(
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
                    Text(
                      'Bill Overview',
                      style: customStyle(18.0, Colors.black, FontWeight.bold),
                    ).cPadOnly(t: 10),
                    const SizedBox(
                      height: 11,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Students Name : ',
                          style:
                              customStyle(14.0, Colors.black, FontWeight.bold),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          studentName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              customStyle(12.0, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Bill Date :$billedOn',
                      style: customStyle(14.0, Colors.black, FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    ///
                    Container(
                        height: 40,
                        width: context.cWidth,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: context.cWidth - 200,
                                child: Center(
                                  child: TextFormField(
                                    controller: logic.couponCode,
                                    onChanged: (val) {},
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(bottom: 13),
                                      border: InputBorder.none,
                                      hintText: 'Voucher Code',
                                      hintStyle:
                                          TextStyle(color: Colors.black26),
                                    ),
                                  ).cPadOnly(
                                    l: 5,
                                    r: 5,
                                  ),
                                ),
                              ).cPadOnly(t: 13),
                              InkWell(
                                onTap: () {
                                  if (logic.couponCodePass.isNotEmpty) {
                                    logic.couponCode.clear();
                                    logic.couponCodePass = '';
                                    logic.couponModel = null;
                                    logic.update();
                                  } else {
                                    logic.couponIsValid(invoiceNo);
                                  }
                                },
                                child: Container(
                                  height: 28,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    color: (logic.couponCodePass.isNotEmpty)
                                        ? Colors
                                            .red // Change to a color you prefer for removal
                                        : const Color.fromRGBO(51, 58, 157,
                                            1), // Original color for applying
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (logic.couponCodePass.isNotEmpty)
                                          ? 'Clear'
                                          : 'Apply',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ).cPadOnly(r: 5, l: 5),
                              ),
                            ],
                          ),
                        )),

                    ///
                    const SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   'Combine the bill totals for ${(logic.homeBillAmount?.data?.students?.length == 1) ? 'the student.' : 'these students.'}  ',
                    //   style: customStyle(13.0, Colors.black, FontWeight.bold),
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    KeyValueField(
                      titleKey: 'Subtotal : ',
                      value: 'SAR  ${(totalAmount)}',
                      // 'SAR  ${((logic.totalAmount - ((logic.totalAmount) * 0.15)) / 100).toStringAsFixed(2)}',
                      fontSize: 13.0,
                    ),
                    KeyValueField(
                      titleKey: 'Tax : ',
                      value: 'SAR  ${(tax)}',
                      // 'SAR  ${(double.parse('${logic.homeBillAmount?.data?.totalTax ?? 0}') / 100)}',
                      fontSize: 13.0,
                    ),
                    if (((logic.couponModel?.data ?? '').toString()).isNotEmpty)
                      KeyValueField(
                        titleKey: 'Voucher Discount : ',
                        value:
                            '- SAR  ${(logic.couponModel?.data?.value ?? 0)}',
                        // 'SAR  ${(double.parse('${logic.homeBillAmount?.data?.totalTax ?? 0}') / 100)}',
                        fontSize: 13.0,
                      ),
                    const Divider(),
                    KeyValueField(
                      titleKey: 'Total : ',
                      value:
                          'SAR  ${((double.parse(totalAmount) + double.parse(tax)) - (double.parse((logic.couponModel?.data?.value ?? 0).toString()))).toStringAsFixed(2)}',
                      // 'SAR  ${logic.totalAmount/100-((logic.totalAmount/100)*0.15)}',
                      // 'SAR  ${(double.parse('${logic.homeBillAmount?.data?.totalPayableAmount ?? 0}') / 100)}',
                      fontSize: 13.0,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            logic.couponCode.clear();
                            Get.back();
                          },
                          child: CustomButtonWidget(
                            backgroundColor: Colors.white,
                            borderColor: primaryColorPurple,
                            vPadding: 8,
                            width: (context.cWidth >= 800) ? 100 : 80,
                            buttonTitle: 'Cancel',
                            titleStyle: customStyle(
                                13.0, primaryColorPurple, FontWeight.bold),
                          ),
                        ),
                        CustomButtonWidget(
                          onTap: () {
                            Get.back();
                            if (logic.couponCodePass.isEmpty) {
                              openUrl("${baseURL}pay/${invoiceNo}");
                            } else {
                              openUrl(
                                  "${baseURL}pay/${invoiceNo}?couponCode=${logic.couponCodePass}");
                            }
                          },
                          backgroundColor: primaryColorPurple,
                          vPadding: 8,
                          width: (context.cWidth >= 800) ? 100 : 80,
                          buttonTitle: 'Pay Now',
                          titleStyle:
                              customStyle(13.0, Colors.white, FontWeight.bold),
                        ).cPadOnly(l: 7),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Accepted Payment Methods',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/visa.png',
                                height: 25,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10),
                              Image.asset(
                                'assets/images/mastercard.png',
                                height: 25,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10),
                              SvgPicture.asset(
                                'assets/images/mada.svg',
                                height: 25,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]).cPadAll(15),
            );
          }),
        ),
      );
    },
  );
}

class KeyValueField extends StatelessWidget {
  final String titleKey;
  final String value;
  var fontSize;

  KeyValueField({
    super.key,
    required this.titleKey,
    required this.value,
    this.fontSize = 17.0,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titleKey,
              style: customStyle(fontSize, const Color.fromRGBO(0, 0, 0, 0.58),
                  FontWeight.bold)),
          RichText(
            textScaleFactor: 1,
            text: TextSpan(children: [
              TextSpan(
                  text: '',
                  style: customStyle(fontSize,
                      const Color.fromRGBO(0, 0, 0, 0.65), FontWeight.normal)),
              TextSpan(
                  text: value,
                  style: customStyle(fontSize, const Color.fromRGBO(0, 0, 0, 1),
                      FontWeight.bold)),
            ]),
          ),
        ],
      );
    });
  }
}

class MenuBox extends StatelessWidget {
  final String text;
  final String img;
  var backgroundColor;

  MenuBox(
      {super.key,
      required this.text,
      required this.img,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 100,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black54, width: 0.2)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            img,
            height: 27,
            width: 27,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text, style: customStyle(13.0, Colors.black, FontWeight.bold))
        ],
      ),
    );
  }
}

class BottomImageList extends StatelessWidget {
  const BottomImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return ListView.builder(
          itemCount: logic.bannerListModel?.data?.length ?? 0,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            var data = logic.bannerListModel?.data?[i];
            return AspectRatio(
              aspectRatio: 2.01,
              child: SizedBox(
                child: CachedNetworkImage(
                  imageUrl: data?.img ?? '',
                  // progressIndicatorBuilder: (context, url, downloadProgress) =>
                  //     CircularProgressIndicator(
                  //         value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            );
          }).cPadAll(10.0).cClipAll(10.0);
    });
  }
}

void dateSelectPopupHome({
  required BuildContext context,
  String id = '',
  var from,
}) {
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Set the border radius here
        ),
        content: SingleChildScrollView(
          child: GetBuilder<HomeController>(builder: (logic) {
            return SizedBox(
              height: 300,
              width: context.cWidth / 2,
              child: SfDateRangePicker(
                confirmText: 'SELECT',
                showNavigationArrow: true,
                onSubmit: (v) {
                  if (v is PickerDateRange) {
                    final DateTime? rangeStartDate = v.startDate;
                    final DateTime? rangeEndDate = v.endDate;
                    logic.startMonth = rangeStartDate;
                    logic.endMonth = rangeEndDate;
                    logic.startDatePass = rangeStartDate
                        .toString()
                        .cGetFormattedDate(format: 'yyyy-MM-dd');
                    logic.endDatePass = rangeStartDate
                        .toString()
                        .cGetFormattedDate(format: 'yyyy-MM-dd');
                    // logic.getHomeAmount();
                    logic.invoiceList.clear();
                    logic.totalAmount = 0.0;
                    logic.getHomeBill();
                    logic.update();
                    if (kDebugMode) {
                      print(rangeStartDate);
                    }
                    if (kDebugMode) {
                      print('//////${logic.startMonth}');
                    }
                    if (kDebugMode) {
                      print(rangeEndDate);
                    }
                  }
                  Get.back();
                },
                onCancel: () {
                  Get.back();
                },
                showActionButtons: true,
                showTodayButton: true,
                view: DateRangePickerView.decade,
                selectionMode: DateRangePickerSelectionMode.range,
              ).cClipAll(10),
            );
          }),
        ),
      );
    },
  );
}
