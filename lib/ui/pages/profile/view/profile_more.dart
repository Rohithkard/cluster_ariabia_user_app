// ignore_for_file: must_be_immutable

import 'package:cluster_arabia/res/images.dart';
import 'package:cluster_arabia/res/style.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/ui/pages/profile/bind/profile_bind.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileImagePart extends StatelessWidget {
  const ProfileImagePart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (logic) {
      return Container(
        height: 150,
        width: context.cWidth,
        color: const Color.fromRGBO(242, 250, 251, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.network(logic.profileModel?.data?.img ?? ''),
                ).cClipAll(100).cPadOnly(l: 25),
                // Positioned(
                //   right: 1,
                //   bottom: 1,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.grey.shade300,
                //         shape: BoxShape.rectangle,
                //         borderRadius: BorderRadius.circular(5),
                //         boxShadow: const [
                //           BoxShadow(
                //             color: Color.fromRGBO(0, 0, 0, 0.25),
                //             offset: Offset(1, 1),
                //             blurRadius: 4,
                //           ),
                //         ]),
                //     height: 26,
                //     width: 26,
                //     child: SvgPicture.asset(
                //       cam,
                //       fit: BoxFit.fill,
                //     ).cPadAll(7),
                //   ).cPadOnly(t: 4),
                // ),
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    logic.profileModel?.data?.name ?? '',
                    style: customStyle(16.0, Colors.black, FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 140,
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    logic.profileModel?.data?.address ?? '',
                    style: customStyle(12.0, Colors.black87, FontWeight.normal),
                  ),
                ),
                // Container(
                //   height: 30,
                //   width: 100,
                //   decoration: BoxDecoration(
                //       border: Border.all(color: Colors.grey, width: 0.5),
                //       borderRadius: BorderRadius.circular(7)),
                //   child: Text(
                //     'Edit profile',
                //     style: customStyle(13.0, Colors.black87, FontWeight.bold),
                //   ).cToCenter,
                // ).cPadOnly(t: 15)
              ],
            ).cExpanded(1)
          ],
        ),
      );
    });
  }
}

class ListTilePart extends StatelessWidget {
  const ListTilePart({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeStackDashboardController.to;
    return Column(
      children: [
        ListTileItemProfile(
          name: 'Invoice',
          icon: transactionIcon,
          onTap: () {
            controller.cameFromProfile = true;
            HomeStackDashboardController.to.changeTabIndex(1);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Children',
          icon: studentsIcon,
          onTap: () {
            controller.cameFromProfile = true;
            HomeStackDashboardController.to.changeTabIndex(2);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Gift Voucher',
          icon: coupon_fill_icon,
          onTap: () {
            controller.cameFromProfile = true;
            Get.toNamed(Routes.coupon);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Help&Support',
          icon: contactUs,
          onTap: () {
            controller.cameFromProfile = true;
            Get.toNamed(Routes.helpAndSupport);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'About Us',
          icon: aboutUs,
          onTap: () {
            controller.cameFromProfile = true;
            Get.toNamed(Routes.aboutUs);
          },
        ).cPadSymmetric(h: 8),
        ListTileItemProfile(
          name: 'Privacy Policy',
          icon: privacyPolicy,
          onTap: () {
            controller.cameFromProfile = true;
            Get.toNamed(Routes.privacyPolicy);
          },
        ).cPadSymmetric(h: 8),
      ],
    ).cPadOnly(t: 20, l: 15);
  }
}

class ListTileItemProfile extends StatelessWidget {
  var icon;
  var name;
  final Function onTap;
  final Color textColor;

  ListTileItemProfile({
    super.key,
    required this.icon,
    required this.name,
    required this.onTap,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -3),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      leading: SvgPicture.asset(
        icon,
        width: 20,
        height: 20,
      ),
      title: Text(
        name,
        style: TextStyle(
            fontSize: 13, color: textColor, fontWeight: FontWeight.normal),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
      ),
      onTap: () => onTap(),
    ).cPadOnly(b: 10, r: 10);
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (logic) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: customStyle(16.0, Colors.black, FontWeight.normal),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                addressIcon,
                width: 25,
                height: 25,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 270,
                    child: Text(
                      logic.profileModel?.data?.name ?? '',
                      style: customStyle(16.0, Colors.black, FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(logic.profileModel?.data?.phone ?? '',
                      style:
                          customStyle(12.0, Colors.black54, FontWeight.normal)),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 270,
                    child: Text(logic.profileModel?.data?.address ?? '',
                        style: customStyle(
                            12.0, Colors.black54, FontWeight.normal)),
                  )
                ],
              ),
            ],
          ).cPadOnly(t: 10, l: 5, r: 5)
        ],
      ).cPadOnly(l: 20, t: 10);
    });
  }
}

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ProfileController.to.deleteAccount();
      },
      child: Container(
        margin: EdgeInsets.only(left: 13, right: 15, top: 12),
        width: context.cWidth,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(203, 6, 6, 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 18,
              ),
              Image.asset(
                deleteIcon,
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                'Delete Account',
                style: customStyle(
                  15.0,
                  Color.fromRGBO(255, 255, 255, 1.0),
                  FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ).cPadOnly(b: 10),
    );
  }
}
