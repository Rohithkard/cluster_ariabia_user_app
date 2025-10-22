import 'package:cluster_arabia/ui/pages/About_us/bind/about_us_bind.dart';
import 'package:cluster_arabia/ui/pages/About_us/view/about_us_view.dart';
import 'package:cluster_arabia/ui/pages/Invoice/bind/invoice_bind.dart';
import 'package:cluster_arabia/ui/pages/Invoice/view/invoice_view.dart';
import 'package:cluster_arabia/ui/pages/children/bind/children_bind.dart';
import 'package:cluster_arabia/ui/pages/children/view/children_view.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/bind/children_innerpage_bind.dart';
import 'package:cluster_arabia/ui/pages/children_innerpage/view/children_innerpage_view.dart';
import 'package:cluster_arabia/ui/pages/contact_us/bind/contact_us_bind.dart';
import 'package:cluster_arabia/ui/pages/contact_us/view/contact_us_view.dart';
import 'package:cluster_arabia/ui/pages/coupon/bind/coupon_bind.dart';
import 'package:cluster_arabia/ui/pages/coupon/view/coupon_view.dart';
import 'package:cluster_arabia/ui/pages/help&support/bind/help&support_bind.dart';
import 'package:cluster_arabia/ui/pages/help&support/view/help&support_view.dart';
import 'package:cluster_arabia/ui/pages/home/bind/home_bind.dart';
import 'package:cluster_arabia/ui/pages/home/view/home_view.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/bind/home_stack_dashboard_bind.dart';
import 'package:cluster_arabia/ui/pages/home_stack_dashboard/view/home_stack_dashborad_view.dart';
import 'package:cluster_arabia/ui/pages/login/bind/login_bind.dart';
import 'package:cluster_arabia/ui/pages/login/view/login_view.dart';
import 'package:cluster_arabia/ui/pages/payment_page/bind/payment_bind.dart';
import 'package:cluster_arabia/ui/pages/payment_page/view/payment_view.dart';
import 'package:cluster_arabia/ui/pages/privary_policy/bind/privacy_policy_bind.dart';
import 'package:cluster_arabia/ui/pages/privary_policy/view/privacy_policy_view.dart';
import 'package:cluster_arabia/ui/pages/profile/bind/profile_bind.dart';
import 'package:cluster_arabia/ui/pages/profile/view/profile_view.dart';
import 'package:cluster_arabia/ui/pages/splash/bind/splash_bind.dart';
import 'package:cluster_arabia/ui/pages/splash/view/spash_view.dart';
import 'package:cluster_arabia/ui/pages/terms_and_conditions/bind/terms_bind.dart';
import 'package:cluster_arabia/ui/pages/terms_and_conditions/view/terms_view.dart';
import 'package:cluster_arabia/utilities/app_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.homeStackDashboard,
      page: () =>  HomeStackDashboard(),
      binding: HomeStackDashboardBinding(),
    ),
    GetPage(
      name: Routes.invoice,
      page: () => const InvoicePage(),
      binding: InvoiceBinding(),
    ),
    GetPage(
      name: Routes.children,
      page: () => const ChildrenView(),
      binding: ChildrenBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.childrenInnerPage,
      page: () => const ChildrenInnerPage(),
      binding: ChildrenInnerPageBinding(),
    ),
    GetPage(
      name: Routes.contactUs,
      page: () => const ContactUs(),
      binding: ContactUsBinding(),
    ),
    GetPage(
      name: Routes.aboutUs,
      page: () => const AboutUsPage(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: Routes.privacyPolicy,
      page: () => const PrivacyPolicy(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: Routes.coupon,
      page: () => const CouponPage(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: Routes.helpAndSupport,
      page: () => const HelpAndSupport(),
      binding: HelpAndSupportBinding(),
    ),
    GetPage(
      name: Routes.toPaymentRoute,
      page: () => const PaymentPage(),
      binding: PaymentBind(),
    ),
    GetPage(
      name: Routes.toTermsAndConditions,
      page: () => const TermsPage(),
      binding: TermsAndConditionBinding(),
    ),
  ];
}