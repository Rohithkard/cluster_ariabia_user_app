// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:cluster_arabia/utilities/dio.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cluster_arabia/models/student_list_model.dart' as student;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class FirstPart extends StatelessWidget {
  const FirstPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(builder: (logic) {
      return Row(
        children: [
          if ((logic.studentModelList?.data?.dataList?.length ?? 0) > 1)
            const StudentDropDown().cPadOnly(r: 10).cExpanded(1),
          InkWell(
            onTap: () {
              dateSelectPopup(context: context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 45,
              // width: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                (logic.startMonth == null && logic.endMonth == null)
                    ? 'Select Date Range'
                    : '${(logic.startMonth)?.cGetFormattedDate(format: 'MM/yyyy')} — ${(logic.endMonth == null) ? (logic.startMonth)?.cGetFormattedDate(format: 'MM/yyyy') : (logic.endMonth)?.cGetFormattedDate(format: 'MM/yyyy')}',
                style: customStyle(12.0, Colors.black, FontWeight.normal),
              ).cToCenter,
            ),
          ).cExpanded(1)
        ],
      ).cPadOnly(t: 15, l: 15, r: 15);
    });
  }
}

class StudentDropDown extends StatelessWidget {
  const StudentDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      child: GetBuilder<InvoiceController>(
        builder: (logic) {
          return DropdownSearch<student.DataList>(
            key: ValueKey('studentFilter'),

            // ────────────────────────────────────────────────────────────────────────────
            // your selection logic
            selectedItem: logic.studentModelList?.data?.dataList
                ?.firstWhere((e) => e.id == logic.filterChooses,
                orElse: () => student.DataList(
                  id: '',
                  studentName: 'Filter with child',
                )),
            onChanged: (student.DataList? v) {
              logic.invoiceList.clear();
              logic.billFilterStudentChooses = v;
              logic.filterChooses = v?.id ?? '';
              logic.getInvoiceList();
            },
            enabled: true,

            // ────────────────────────────────────────────────────────────────────────────
            // 1) decoratorProps now takes `decoration`, not `dropdownSearchDecoration`:
            decoratorProps: DropDownDecoratorProps(
              decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                disabledBorder: InputBorder.none,
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  gapPadding: 15,
                ),
                hintText: 'Filter with Student',
              ),
            ),

            // ────────────────────────────────────────────────────────────────────────────
            // 2) suffixProps controls the “clear” (×) and the suffix icon group:
            suffixProps: DropdownSuffixProps(
              // showClearButton: logic.billFilterStudentChooses != null,
              clearButtonProps: ClearButtonProps(
                constraints: const BoxConstraints(maxWidth: 30),
                padding: const EdgeInsets.only(right: 10, left: 10),
                icon: const Icon(Icons.clear, size: 20),
              ),
              // if you want to override the default arrow icons, you could also do:
              // dropdownButtonProps: DropdownButtonProps(
              //   iconClosed: Icon(Icons.keyboard_arrow_down),
              //   iconOpened: Icon(Icons.keyboard_arrow_up),
              // ),
            ),

            // ────────────────────────────────────────────────────────────────────────────
            // 3) clickProps controls whether that little arrow actually shows up at all:
            // clickProps: ClickProps(
            //   // showDropdownButton: logic.billFilterStudentChooses == null,
            //   dropdownButtonProps: DropdownButtonProps(
            //     padding: const EdgeInsets.only(right: 8),
            //     constraints: const BoxConstraints(maxWidth: 20),
            //   ),
            // ),

            // ────────────────────────────────────────────────────────────────────────────
            // 4) items now must be a sync or async function:
            items: (String? filter, LoadProps? lp) {
              return logic.studentModelList?.data?.dataList
                  ?? <student.DataList>[];
            },

            // ────────────────────────────────────────────────────────────────────────────
            // 5) everything else stays the same:
            itemAsString: (student.DataList v) => v.studentName ?? '',
            compareFn: (a, b) => a.id == b.id,
            popupProps: PopupProps.menu(
              fit: FlexFit.loose,
              menuProps: MenuProps(borderRadius: BorderRadius.circular(10)),
              showSearchBox: false,
              showSelectedItems: false,
              disabledItemFn: (s) => (s.gender ?? '').startsWith('I'),
            ),
          ).cToCenter; // Center the widget using your extension
        },
      ),
    );
  }
}

void dateSelectPopup({
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
          child: GetBuilder<InvoiceController>(builder: (logic) {
            return SizedBox(
              height: 300,
              width: context.cWidth / 2,
              child: SfDateRangePicker(
                confirmText: 'SELECT',
                showNavigationArrow: true,
                controller: logic.dateRangeController,
                onSubmit: (v) {
                  if (v is PickerDateRange) {
                    final DateTime? rangeStartDate = v.startDate;
                    final DateTime? rangeEndDate = v.endDate;
                    logic.startMonth = rangeStartDate;
                    logic.endMonth = rangeEndDate;
                    logic.endDatePass = rangeEndDate
                        .toString()
                        .cGetFormattedDate(format: 'yyyy-MM-dd');
                    logic.startDatePass = rangeStartDate
                        .toString()
                        .cGetFormattedDate(format: 'yyyy-MM-dd');
                    logic.update();
                    logic.invoiceList.clear();
                    logic.getInvoiceList();

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

class ListPart extends StatelessWidget {
  const ListPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(builder: (logic) {
      return Expanded(
        child: ListView.builder(
            itemCount: logic.invoiceList.length,
            shrinkWrap: true,
            controller: logic.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              var data = logic.invoiceList[i];
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text((data.billedOn ?? '')
                                .cGetFormattedDate(format: 'MMM yyyy'))
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 25,
                          decoration: BoxDecoration(
                              color: ((data.paidOn ?? '').isEmpty)
                                  ? const Color.fromRGBO(255, 243, 235, 1)
                                  : const Color.fromRGBO(221, 252, 243, 1),
                              border: Border.all(
                                  color: ((data.paidOn ?? '').isEmpty)
                                      ? const Color.fromRGBO(249, 122, 30, 1)
                                      : const Color.fromRGBO(33, 196, 141, 1)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  height: 8,
                                  width: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ((data.paidOn ?? '').isEmpty)
                                        ? const Color.fromRGBO(249, 122, 30, 1)
                                        : const Color.fromRGBO(33, 196, 141, 1),
                                  )),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                ((data.paidOn) == null) ? 'UnPaid' : 'Paid',
                                style: customStyle(
                                    13.0,
                                    ((data.paidOn ?? '').isEmpty)
                                        ? const Color.fromRGBO(249, 122, 30, 1)
                                        : const Color.fromRGBO(33, 196, 141, 1),
                                    FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Invoice no ${data.id ?? ''}'),
                        Text(
                          'SAR ${(double.parse('${data.amount ?? 0}') + double.parse('${data.taxAmount ?? 0}')) / 100}',
                          style:
                              customStyle(12.0, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // const DottedLine(
                    //   dashGapLength: 6,
                    //   lineThickness: 0.5,
                    // ),
                    Divider(
                      height: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        // CachedNetworkImage(
                        //   imageUrl: data.img ?? '',
                        //   height: 25,
                        //   width: 25,
                        //   placeholder: (context, url) =>
                        //       const CircularProgressIndicator(),
                        //   errorWidget: (context, url, error) => const Icon(
                        //     Icons.account_circle_rounded,
                        //     size: 25,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        SizedBox(
                          width: 250,
                          child: Text(
                              '${data.student?.name ?? ' '} - ${data.student?.std ?? ''} ${data.student?.division ?? ''}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: customStyle(
                                  13.0, Colors.black, FontWeight.bold)),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        // SvgPicture.asset(
                        //   schoolcap,
                        //   height: 12,
                        //   width: 12,
                        // ),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        Text(data.school?.name ?? '',
                            style: customStyle(
                                12.0, Colors.black, FontWeight.normal)),
                        Text(' ${data.school?.id ?? ''}',
                            style: customStyle(
                                12.0,
                                const Color.fromRGBO(99, 99, 99, 1),
                                FontWeight.normal)),
                      ],
                    ).cPadOnly(t: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              routeIcon,
                              height: 12,
                              width: 12,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                              width: 150,
                              child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  data.student?.busInRoute?.routeInfo
                                          ?.routeName ??
                                      '',
                                  style: customStyle(
                                      11.0, Colors.black, FontWeight.normal)),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  data.student?.busInRoute?.routeInfo
                                          ?.startingPoint ??
                                      '',
                                  style: customStyle(
                                      10.0,
                                      const Color.fromRGBO(99, 99, 99, 1),
                                      FontWeight.normal)),
                            ).cExpanded(1),
                          ],
                        ).cPadOnly(t: 5).cExpanded(2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (data.paidOn != null)
                              InkWell(
                                onTap: () {
                                  openUrl(
                                    'https://app.racotransport.com/view_bill/${data.totalBillAmountData?.id ?? ''}'
                                      ,
                                      isPay: false);
                                },
                                child: CustomButtonWidget(
                                  backgroundColor: Colors.white,
                                  borderColor: primaryColorPurple,
                                  vPadding: 8,
                                  // width: (context.cWidth >= 800) ? 80 : 60,
                                  buttonTitle: 'View Bill',
                                  titleStyle: customStyle(10.0,
                                      primaryColorPurple, FontWeight.bold),
                                ),
                              ),
                            if (data.paidOn == null)
                              InkWell(
                                onTap: () {
                                  logic.couponModel = null;
                                  logic.couponCodePass = '';
                                  logic.couponCode.clear();
                                  payBillPopupInVoice(
                                      context: context,
                                      billedOn: (data.billedOn ?? '')
                                          .cGetFormattedDate(
                                              format: 'MMM yyyy'),
                                      studentName: data.student?.name ?? '',
                                      invoiceNo:
                                          data.totalBillAmountData?.id ?? '',
                                      totalAmount: ((data.amount ?? 0) / 100)
                                          .toStringAsFixed(2),
                                      tax: ((data.taxAmount ?? 0) / 100)
                                          .toStringAsFixed(2));
                                },
                                child: CustomButtonWidget(
                                  backgroundColor: primaryColorPurple,
                                  vPadding: 8,
                                  // width: (context.cWidth >= 800) ? 60 : 45,
                                  buttonTitle: 'Pay Now',
                                  titleStyle: customStyle(
                                      10.0, Colors.white, FontWeight.bold),
                                ),
                              ),
                          ],
                        ).cPadOnly(t: 8).cExpanded(1),
                      ],
                    ),
                  ],
                ),
              ).cMargOnly(t: (i == 0) ? 15 : 5, l: 15, r: 15, b: 10);
            }),
      );
    });
  }
}

void payBillPopupInVoice({
  required BuildContext context,
  String invoiceNo = '',
  String totalAmount = '',
  String tax = '',
  String studentName = '',
  String billedOn = '',
}) {
  cLog('body$invoiceNo');
  showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        scrollable: true,
        // alignment: Alignment.topRight,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
          child: GetBuilder<InvoiceController>(builder: (logic) {
            return Container(
              // height: 200,
              // width: 330,
              padding: const EdgeInsets.only(top: 1, bottom: 10),
              decoration: BoxDecoration(
                  // color: Colors.transparent,
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
                        SizedBox(height: 3,),
                        Text(
                          studentName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: customStyle(
                              12.0, Colors.black, FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Bill Date :$billedOn',
                      style: customStyle(12.0, Colors.black, FontWeight.normal),
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
                                        fontSize: 14,
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
                      fontSize: 12.0,
                    ),
                    KeyValueField(
                      titleKey: 'Tax : ',
                      value: 'SAR  ${(tax)}',
                      // 'SAR  ${(double.parse('${logic.homeBillAmount?.data?.totalTax ?? 0}') / 100)}',
                      fontSize: 12.0,
                    ),
                    if (((logic.couponModel?.data ?? '').toString()).isNotEmpty)
                      KeyValueField(
                        titleKey: 'Voucher Discount : ',
                        value:
                            '- SAR  ${(logic.couponModel?.data?.value ?? 0)}',
                        // 'SAR  ${(double.parse('${logic.homeBillAmount?.data?.totalTax ?? 0}') / 100)}',
                        fontSize: 12.0,
                      ),
                    const Divider(),
                    KeyValueField(
                      titleKey: 'Total : ',
                      value:
                          'SAR  ${((double.parse(totalAmount) + double.parse(tax)) - (double.parse((logic.couponModel?.data?.value ?? 0).toString()))).toStringAsFixed(2)}',
                      // 'SAR  ${logic.totalAmount/100-((logic.totalAmount/100)*0.15)}',
                      // 'SAR  ${(double.parse('${logic.homeBillAmount?.data?.totalPayableAmount ?? 0}') / 100)}',
                      fontSize: 12.0,
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
                                10.0, primaryColorPurple, FontWeight.bold),
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
                          buttonTitle: 'Pay',
                          titleStyle:
                              customStyle(10.0, Colors.white, FontWeight.bold),
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
    return GetBuilder<InvoiceController>(builder: (logic) {
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
