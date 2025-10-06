import 'package:cached_network_image/cached_network_image.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/bind/children_innerpage_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:cluster_arabia/utilities/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProfilePart extends StatelessWidget {
  const ProfilePart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: (logic.studentViewById?.data?.img ?? ''),
            placeholder: (context, url) => const CircularProgressIndicator(),
            width: 80,
            height: 80,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                logic.studentViewById?.data?.studentName ?? '',
                style: customStyle(20.0, Colors.black, FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${logic.studentViewById?.data?.std ?? ''} ${logic.studentViewById?.data?.division ?? ''}',
                style: customStyle(11.0, Colors.black, FontWeight.normal),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                logic.studentViewById?.data?.school?.schoolName ?? '',
                style: customStyle(10.0, Colors.black, FontWeight.normal),
              ),
            ],
          ).cExpanded(1)
        ],
      );
    });
  }
}

class AddressPart extends StatelessWidget {
  const AddressPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: customStyle(15.0, Colors.black, FontWeight.bold),
          ),
          Text(
            logic.studentViewById?.data?.address ?? '',
            style: customStyle(12.0, Colors.black, FontWeight.normal),
          ).cPadOnly(t: 5),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  logic.clearVariable();
                  showDisableDialog(context: context);
                },
                child: Container(
                  // width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColorPurple),
                    borderRadius: BorderRadius.circular(8),
                    // boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,.1),blurRadius: 12,spreadRadius: 3)]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        disableRequestIcon,
                        width: 15,
                        height: 15,
                      ),
                      Text(
                        'Request To Disable',
                        style: customStyle(
                            13.0, primaryColorPurple, FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ).cExpanded(1),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  // width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColorPurple),
                    borderRadius: BorderRadius.circular(8),
                    // boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,.1),blurRadius: 10,spreadRadius: 2)]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(locationIcon),
                      Text(
                        'Track Location',
                        style: customStyle(
                            13.0, primaryColorPurple, FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ).cExpanded(1),
            ],
          ),
        ],
      ).cPadOnly(t: 10);
    });
  }
}

//Show Dialog
void showDisableDialog({required BuildContext context}) async {
  showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            scrollable: true,
            // alignment: Alignment.topRight,
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            contentPadding: EdgeInsets.zero,
            content: GetBuilder<ChildrenInnerPageController>(builder: (logic) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Request to Disable The Student',
                    style: customStyle(15.0, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Select Date',
                    style: customStyle(13.0, Colors.black, FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      logic.selectDate(context: context);
                    },
                    child: Container(
                      width: context.cWidth,
                      margin: const EdgeInsets.only(left: 13, right: 13),
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.black),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              logic.dateTimeChoose,
                              style: customStyle(
                                  13.0, Colors.black, FontWeight?.normal),
                            ),
                            IconButton(
                              iconSize: 20,
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.calendar_today_sharp),
                              onPressed: () {
                                logic.selectDate(context: context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Reason',
                    style: customStyle(13.0, Colors.black, FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: context.cWidth,
                    margin: const EdgeInsets.only(left: 13, right: 13),
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )),
                    child: TextFormField(
                      controller: logic.reasonTextFormField,
                      maxLines: 4,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter The Reason',
                          hintStyle: customStyle(
                              13.0, Colors.black26, FontWeight.normal)),
                    ).cPadOnly(l: 10),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: CustomButtonWidget(
                          backgroundColor: Colors.white,
                          borderColor: primaryColorPurple,
                          vPadding: 8,
                          width: (context.cWidth >= 800) ? 100 : 100,
                          buttonTitle: 'Cancel',
                          titleStyle: customStyle(
                              13.0, primaryColorPurple, FontWeight.bold),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          logic.raiseRequest();
                        },
                        child: CustomButtonWidget(
                          backgroundColor: primaryColorPurple,
                          vPadding: 8,
                          width: (context.cWidth >= 800) ? 100 : 100,
                          buttonTitle: 'Confirm',
                          titleStyle:
                              customStyle(13.0, Colors.white, FontWeight.bold),
                        ).cPadOnly(l: 7),
                      ),
                    ],
                  ),
                ],
              ).cPadAll(20);
            }));
      });
}
//End Dialog

class SchoolDetails extends StatelessWidget {
  const SchoolDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'School',
            style: customStyle(15.0, Colors.black, FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(232, 231, 233, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      schoolImage,
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              logic.studentViewById?.data?.school?.schoolName ??
                                  '',
                              style: customStyle(
                                  14.0, Colors.black, FontWeight.bold),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${logic.studentViewById?.data?.std ?? ''} (${logic.studentViewById?.data?.division ?? ''})',
                          style: customStyle(
                              12.0, Colors.black, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          logic.studentViewById?.data?.admissionNo ?? '',
                          style: customStyle(
                              12.0, Colors.black, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          logic.studentViewById?.data?.school?.phone ?? '',
                          style: customStyle(
                              12.0, Colors.black, FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      makePhoneCall(
                          phoneNumber:
                              logic.studentViewById?.data?.school?.phone ?? '');
                    },
                    icon: const Icon(
                      Icons.call,
                      size: 18,
                    )).cPosition(b: -10, r: -10)
              ],
            ),
          )
        ],
      ).cPadOnly(t: 10);
    });
  }
}

class BusDetails extends StatelessWidget {
  const BusDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Bus Info',
            style: customStyle(15.0, Colors.black, FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(232, 231, 233, 1),
                borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: (logic.studentViewById?.data?.busInRoute
                              ?.busInfo?.img ??
                          busImage),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      width: 80,
                      height: 80,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    // Image.network(logic.studentViewById?.data?.busInRoute?.busInfo?.img??busImage,height: 80,width: 80,),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          logic.studentViewById?.data?.busInRoute?.busInfo
                                  ?.driverName ??
                              '',
                          style:
                              customStyle(14.0, Colors.black, FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          logic.studentViewById?.data?.busInRoute?.busInfo
                                  ?.busModel ??
                              '',
                          style: customStyle(
                              12.0, Colors.black, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          logic.studentViewById?.data?.busInRoute?.busInfo
                                  ?.busNo ??
                              '',
                          style: customStyle(
                              12.0, Colors.black, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          logic.studentViewById?.data?.busInRoute?.busInfo
                                  ?.driverPhone ??
                              '',
                          style: customStyle(
                              12.0, Colors.black, FontWeight.normal),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      makePhoneCall(
                          phoneNumber: logic.studentViewById?.data?.busInRoute
                                  ?.busInfo?.driverPhone ??
                              '');
                    },
                    icon: const Icon(
                      Icons.call,
                      size: 18,
                    )).cPosition(b: -10, r: -10)
              ],
            ),
          )
        ],
      ).cPadOnly(t: 10);
    });
  }
}

class PickupPointSection extends StatelessWidget {
  const PickupPointSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pickup Point',
            style: customStyle(15.0, Colors.black, FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            width: context.cWidth,
            // height: 110,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(232, 231, 233, 1),
                borderRadius: BorderRadius.circular(11)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup point Name : ',
                  style: customStyle(11.0, Colors.black, FontWeight.normal),
                ),
                Text(
                  logic.studentViewById?.data?.pickUp?.pickUpName ?? '',
                  style: customStyle(11.0, Colors.black, FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Dropping point Name : ',
                  style: customStyle(11.0, Colors.black, FontWeight.normal),
                ),
                Text(
                  logic.studentViewById?.data?.school?.schoolName ?? '',
                  style: customStyle(11.0, Colors.black, FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Route Name : ',
                  style: customStyle(11.0, Colors.black, FontWeight.normal),
                ),
                Text(
                  logic.studentViewById?.data?.busInRoute?.routeInfo
                          ?.routeName ??
                      '',
                  style: customStyle(11.0, Colors.black, FontWeight.bold),
                ),
              ],
            ).cPadAll(8),
          )
        ],
      ).cPadOnly(t: 10);
    });
  }
}

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Student Location',
            style: customStyle(15.0, Colors.black, FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          Container(
            width: context.cWidth,
            height: 110,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(232, 231, 233, 1),
                borderRadius: BorderRadius.circular(11)),
            child: GoogleMap(
              // markers: logic.markersSet,
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                // logic.controller = controller;
                // logic.manager?.setMapId(controller.mapId);
              },
              initialCameraPosition: logic.kGooglePlex,
              // onCameraMove: logic.manager?.onCameraMove,
              // onCameraIdle: logic.manager?.updateMap,
              zoomControlsEnabled: false,
            ),
          )
        ],
      ).cPadOnly(t: 10);
    });
  }
}

class OtherInfo extends StatelessWidget {
  const OtherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Other Info',
        style: customStyle(15.0, Colors.black, FontWeight.bold),
      ),
      const SizedBox(
        height: 8,
      ),
      Container(
        // height: 115,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(232, 231, 233, 1),
            borderRadius: BorderRadius.circular(10)),
        child: GetBuilder<ChildrenInnerPageController>(builder: (logic) {
          return Column(
            children: [
              OtherInfoType(
                head: 'Route',
                info: logic.studentViewById?.data?.busInRoute?.routeInfo
                        ?.routeName ??
                    '',
              ),
              OtherInfoType(
                head: 'City',
                info: logic.studentViewById?.data?.country ?? '',
              ),
              OtherInfoType(
                head: 'Region',
                info: logic.studentViewById?.data?.state ?? '',
              ),
              OtherInfoType(
                head: 'Service Start Date',
                info: (logic.studentViewById?.data?.serviceStartedOn ?? '')
                    .cGetFormattedDate(format: 'dd MMM yyyy'),
              ),
              OtherInfoType(
                head: 'Service End Date',
                info: (logic.studentViewById?.data?.serviceEndedOn ?? '')
                    .cGetFormattedDate(format: 'dd MMM yyyy'),
              ),
            ],
          );
        }),
      )
    ]).cPadOnly(t: 10);
  }
}

class OtherInfoType extends StatelessWidget {
  final String head;
  final String info;

  const OtherInfoType({super.key, required this.head, required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(head),
        Text(info),
      ],
    );
  }
}
