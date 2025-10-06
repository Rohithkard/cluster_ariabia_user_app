import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/coupon/bind/coupon_bind.dart';
import 'package:cluster_arabia/ui/pages/coupon/view/coupon_more.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: commonBackGroundColor,
        appBar: commonAppBarBack('Gift Voucher', primaryColorPurple, () {
          CouponController.to.onInit();
        }),
        body: const CouponList());
  }
}
