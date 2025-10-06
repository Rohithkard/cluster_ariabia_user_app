import 'package:cluster_arabia/res/colors.dart';
import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/ui/pages/Invoice/view/invoice_more.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/utilities/common_widget.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatelessWidget {
  const InvoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    InvoiceController.to.context = context;
    return WillPopScope(
      onWillPop: () async {
        HomeStackDashboardController.to.changeTabIndex(0);
        return false;
      },
      child: Scaffold(
        backgroundColor: commonBackGroundColor,
        appBar: commonAppBarBack('Invoices', primaryColorPurple, () {
          InvoiceController.to.onInit();
        }),
        body: const Column(
          children: [FirstPart(), ListPart()],
        ),
      ),
    );
  }
}
