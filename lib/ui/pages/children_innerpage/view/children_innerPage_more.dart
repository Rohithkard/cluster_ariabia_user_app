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
  const ProfilePart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      final data = logic.studentViewById?.data;

      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Circular image with fallback
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: data?.img ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const CircularProgressIndicator(strokeWidth: 2),
                errorWidget: (_, __, ___) => const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Icon(Icons.person, color: Colors.white, size: 40),
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Info Column
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data?.studentName ?? 'Student Name',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${data?.std ?? ''} ${data?.division ?? ''}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    data?.school?.schoolName ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class AddressPart extends StatelessWidget {
  const AddressPart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      final data = logic.studentViewById?.data;

      return Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Address',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Text(
              data?.address ?? 'No address available',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[800],
                    height: 1.4,
                  ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _modernActionButton(
                  icon: disableRequestIcon,
                  label: 'Request Disable',
                  color: Colors.redAccent,
                  onTap: () {
                    logic.clearVariable();
                    showDisableDialog(context: context);
                  },
                ).cExpanded(1),
                const SizedBox(width: 10),
                // _modernActionButton(
                //   icon: locationIcon,
                //   label: 'Track Location',
                //   color: primaryColorPurple,
                //   onTap: () {},
                // ).cExpanded(1),
              ],
            ),
          ],
        ),
      );
    });
  }

  /// Reusable modern button
  Widget _modernActionButton({
    required String icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Ink(
        height: 44,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.15),
              color.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(icon, width: 18, height: 18, color: color),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 13.5,
              ),
            ),
          ],
        ),
      ),
    );
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
  const SchoolDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      final school = logic.studentViewById?.data?.school;

      return _ModernCard(
        title: 'School Information',
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              schoolImage,
              width: 70,
              height: 70,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    school?.schoolName ?? 'N/A',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    logic.studentViewById?.data?.admissionNo ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[700],
                        ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.call, size: 14, color: Colors.green[700]),
                      const SizedBox(width: 6),
                      Text(
                        school?.phone ?? 'No contact',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon:
                  const Icon(Icons.phone_in_talk_rounded, color: Colors.green),
              onPressed: () => makePhoneCall(phoneNumber: school?.phone ?? ''),
            )
          ],
        ),
      );
    });
  }
}

/// ✅ Modern Bus Details Card
class BusDetails extends StatelessWidget {
  const BusDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      final bus = logic.studentViewById?.data?.busInRoute?.busInfo;

      return _ModernCard(
        title: 'Bus Information',
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: bus?.img ?? busImage,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                placeholder: (_, __) => const SizedBox(
                  width: 70,
                  height: 70,
                  child:
                      Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                errorWidget: (_, __, ___) => const Icon(
                  Icons.directions_bus_rounded,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bus?.driverName ?? 'Driver Not Assigned',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(bus?.busModel ?? '',
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text('Bus No: ${bus?.busNo ?? ''}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[700])),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.call, size: 14, color: Colors.green[700]),
                      const SizedBox(width: 6),
                      Text(bus?.driverPhone ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.grey[800])),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.phone_rounded, color: Colors.green),
              onPressed: () =>
                  makePhoneCall(phoneNumber: bus?.driverPhone ?? ''),
            ),
          ],
        ),
      );
    });
  }
}

/// ✅ Modern Pickup Point Card
class PickupPointSection extends StatelessWidget {
  const PickupPointSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      final pickup = logic.studentViewById?.data?.pickUp;
      final route = logic.studentViewById?.data?.busInRoute?.routeInfo;
      final school = logic.studentViewById?.data?.school;

      return _ModernCard(
        title: 'Pickup & Route Details',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _infoRow('Pickup Point', pickup?.pickUpName),
            _infoRow('Drop Point', school?.schoolName),
            _infoRow('Route Name', route?.routeName),
          ],
        ),
      );
    });
  }
}

/// --- Shared Card Wrapper ---
class _ModernCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _ModernCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

/// --- Small Info Text Row ---
Widget _infoRow(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$label:',
            style: const TextStyle(fontSize: 12.5, color: Colors.grey),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value ?? 'N/A',
            style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: Colors.black87),
          ),
        ),
      ],
    ),
  );
}

class OtherInfo extends StatelessWidget {
  const OtherInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChildrenInnerPageController>(builder: (logic) {
      final data = logic.studentViewById?.data;

      return Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Other Information',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Info Rows
            _infoTile('Route', data?.busInRoute?.routeInfo?.routeName),
            _infoTile('City', data?.country),
            _infoTile('Region', data?.state),
            _infoTile(
                'Service Start Date',
                (data?.serviceStartedOn ?? '')
                    .cGetFormattedDate(format: 'dd MMM yyyy')),
            _infoTile(
                'Service End Date',
                (data?.serviceEndedOn ?? '')
                    .cGetFormattedDate(format: 'dd MMM yyyy')),
          ],
        ),
      );
    });
  }

  /// --- Shared Row Style ---
  Widget _infoTile(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 13.5,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value?.isNotEmpty == true ? value! : '-',
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 13.5,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
