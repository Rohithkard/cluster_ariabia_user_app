import 'package:cached_network_image/cached_network_image.dart';
import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SearchPart extends StatelessWidget {
  const SearchPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenController>(builder: (logic) {
      return Container(
        width: context.cWidth,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: primaryColorPurple),
            borderRadius: BorderRadius.circular(18)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width: 270,
                child: TextFormField(
                  controller: logic.searchChildrenController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15, bottom: 13),
                      hintText: 'Search...'),
                  onFieldSubmitted: (val) {
                    logic.studentList.clear();
                    logic.pageNO = 1;
                    logic.getStudentList();
                  },
                  onChanged: (v) {
                    if (v.isEmpty) {
                      logic.studentList.clear();
                      logic.pageNO = 1;
                      logic.getStudentList();
                    }
                  },
                )),
            (logic.searchChildrenController.text=='')
            ?InkWell(
              onTap: (){},
              child: const Icon(
                Icons.search,
                size: 20,
              ),
            )
                :InkWell(
              onTap: () {
                logic.searchChildrenController
                    .text = '';
                logic.studentList.clear();
                logic.pageNO=1;
                logic.getStudentList();
              },
              child: const Icon(
                Icons.close_outlined,
                color: Colors.black,
                size: 20,
              ),
            )
          ],
        ).cPadOnly(r: 10),
      );
    });
  }
}

class ListPart extends StatelessWidget {
  const ListPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenController>(builder: (logic) {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: logic.studentList.length ?? 0,
          itemBuilder: (context, i) {
            var data = logic.studentList[i];
            return InkWell(
              onTap: () {
                Get.toNamed(Routes.childrenInnerPage,
                    arguments: [data.id ?? '']);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
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
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: (data.img ?? ''),
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              width: 55,
                              height: 55,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ).cClipAll(10.0),
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              width: 240,
                              child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  data.studentName ?? '',
                                  textAlign: TextAlign.start,
                                  style: customStyle(
                                      15.0, Colors.black, FontWeight.bold)),
                            ),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 270,
                                child: Text(
                                  '${data.std ?? ' '}(${data.division ?? ''})',
                                  style: customStyle(
                                      11.0, Colors.black, FontWeight.normal),
                                ))
                          ],
                        ).cPadOnly(t: 10),
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
                            SizedBox(
                              width: 265,
                              child: Text(
                                  data.school?.schoolName ?? '',
                                  maxLines: 2,
                                  style: customStyle(
                                      12.0, Colors.black, FontWeight.normal)),
                            ),

                          ],
                        ).cPadOnly(t: 2, b: 10),
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
                            Text(
                                // 'Route name',
                                data.busInRoute?.routeInfo?.routeName ?? '',
                                style: customStyle(
                                    10.0, Colors.black, FontWeight.normal)),
                            Text(
                                // ' (pickup point name)',
                                ' (${data.pickUp?.pickUpName ?? ''}) - SAR ${double.parse('${data.busInRoute?.routeInfo?.fareForRoute ?? ' '}') * .01}',
                                style: customStyle(
                                    10.0,
                                    const Color.fromRGBO(99, 99, 99, 1),
                                    FontWeight.normal)),
                          ],
                        ).cPadOnly(t: 1),
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //         'AD NO :(${data.admissionNo ?? ''})',
                        //         style: customStyle(
                        //             10.0,
                        //             Colors.black,
                        //             FontWeight.normal)).cPadOnly(t: 6),
                        //
                        //     Text(
                        //         'View Details',
                        //         style: defaultUnder10Line).cPadOnly(t: 6),
                        //   ],
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        // CustomButtonWidget(
                        //     backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        //     borderColor: Colors.black54,
                        //     vPadding: 4,
                        //     width: (context.cWidth >= 800) ? 55 : 55,
                        //     radius: 13,
                        //     // buttonTitle: '4(B)',
                        //     buttonTitle:
                        //         '${data.std ?? ' '}(${data.division ?? ''})',
                        //     titleStyle: customStyle(
                        //         11.0, Colors.black, FontWeight.normal)),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        Container(width: 15,
                        height: 15,
                          decoration: BoxDecoration(
                            color: (data.status ??true)
                                ? const Color.fromRGBO(3, 159, 0, 1)
                                : Colors.redAccent,
                            shape: BoxShape.circle
                          ),
                        )

                        // CustomButtonWidget(
                        //     backgroundColor: (data.status ??true)
                        //         ? const Color.fromRGBO(3, 159, 0, 1)
                        //         : Colors.redAccent,
                        //     vPadding: 5,
                        //     width: (context.cWidth >= 800) ? 70 : 65,
                        //     radius: 13,
                        //     // buttonTitle: (data?.status==1)?'${(data?.status)}':'${(data?.status)}',
                        //     // buttonTitle: "${data?.status ?? '--'}",
                        //     buttonTitle: (data.status ??true)?'Active':'Inactive',
                        //     titleStyle: customStyle(
                        //         11.0, Colors.white, FontWeight.bold)),
                      ],
                    ).cPosition(r: 0),
                    // Icon(Icons.location_on_rounded).cPosition(r: 0, t: 35),
                    // SvgPicture.asset(
                    //   locationIcon,
                    //   color: primaryColorPurple,
                    //   width: 30,
                    //   height: 30,
                    // ).cPosition(r: 0, t: 30),


                    // CustomButtonWidget(
                    //         backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    //         borderColor: Colors.black54,
                    //         vPadding: 4,
                    //         // width: 85,
                    //         radius: 13,
                    //         // buttonTitle: 'SAR 100.50',
                    //         buttonTitle:
                    //             '${double.parse('${data.busInRoute?.routeInfo?.fareForRoute ?? ' '}') * .01}',
                    //         titleStyle: customStyle(
                    //             11.0, Colors.black, FontWeight.normal))
                    //     .cPosition(r: 0, b: 0),
                  ],
                ),
              ).cPadOnly(t: (i == 0) ? 5 : 13),
            );
          });
    });
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenController>(builder: (logic) {
      return Row(
        children: [
          Wrap(
            children: [
              ActionChip(
                visualDensity: const VisualDensity(vertical: -3),
                // avatar: Icon(Icons.remove),
                backgroundColor: (logic.isSelected == 0)
                    ? const Color.fromRGBO(65, 54, 133, 1)
                    : Colors.white,
                labelStyle: TextStyle(
                    color:
                        (logic.isSelected == 0) ? Colors.white : Colors.black,
                    fontSize: 11.0),
                label: Text(
                  'All',
                  style: customStyle(
                      10.0,
                      (logic.isSelected == 0)
                          ? Colors.white
                          : primaryColorPurple,
                      FontWeight.normal),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: primaryColorPurple) // Set the border radius here
                    ),
                onPressed: () {
                  logic.isSelected = 0;
                  logic.statusIsSelected = '';
                  logic.studentList.clear();
                  logic.pageNO=1;
                  logic.getStudentList();
                  logic.update();
                },
              ),
              const SizedBox(
                width: 8,
              ),
              ActionChip(
                visualDensity: const VisualDensity(vertical: -3),

                // avatar: Icon(Icons.remove),
                backgroundColor: (logic.isSelected == 1)
                    ? const Color.fromRGBO(65, 54, 133, 1)
                    : Colors.white,
                labelStyle: TextStyle(
                    color:
                        (logic.isSelected == 1) ? Colors.white : Colors.black,
                    fontSize: 11.0),
                label: Text(
                  'Active',
                  style: customStyle(
                      10.0,
                      (logic.isSelected == 1)
                          ? Colors.white
                          : primaryColorPurple,
                      FontWeight.normal),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: primaryColorPurple) // Set the border radius here
                    ),
                onPressed: () {
                  logic.isSelected = 1;
                  logic.statusIsSelected = 'true';
                  logic.studentList.clear();
                  logic.pageNO=1;
                  logic.getStudentList();
                  logic.update();
                },
              ),
              const SizedBox(
                width: 8,
              ),
              ActionChip(
                visualDensity: const VisualDensity(vertical: -3),

                // avatar: Icon(Icons.remove),
                backgroundColor: (logic.isSelected == 2)
                    ? const Color.fromRGBO(65, 54, 133, 1)
                    : Colors.white,
                labelStyle: TextStyle(
                    color:
                        (logic.isSelected == 2) ? Colors.white : Colors.black,
                    fontSize: 11.0),
                label: Text(
                  'Inactive',
                  style: customStyle(
                      10.0,
                      (logic.isSelected == 2)
                          ? Colors.white
                          : primaryColorPurple,
                      FontWeight.normal),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                        color: primaryColorPurple) // Set the border radius here
                    ),
                onPressed: () {
                  logic.isSelected = 2;
                  logic.statusIsSelected = 'false';
                  logic.studentList.clear();
                  logic.pageNO=1;
                  logic.getStudentList();
                  logic.update();
                },
              ),
            ],
          ),
        ],
      ).cPadOnly(t: 10, b: 10);
    });
  }
}
