import 'package:flutter/material.dart';
import 'package:transvision_app1/BottomScreen/all_record.dart';
import 'package:transvision_app1/MyComponent/constant/colors.dart';
import 'package:transvision_app1/Screen/bookingScreen/booking_details.dart';
import 'package:transvision_app1/BottomScreen/address.dart';
import 'package:transvision_app1/Screen/bookingScreen/booking_details2.dart';
import 'package:transvision_app1/Screen/loginScreen/login_screen.dart';
import 'package:transvision_app1/Screen/loginScreen/reset_password.dart';
import 'package:transvision_app1/Screen/loginScreen/splash_screen.dart';
import 'package:transvision_app1/consignee_Dashboard/bottom.dart';
import 'package:transvision_app1/consignee_Dashboard/consignee_screen/consignee_do_slip.dart';
import 'package:transvision_app1/consignee_Dashboard/consignee_screen/invoice_screens/damage_invoice.dart';
import 'package:transvision_app1/consignee_Dashboard/consignee_screen/invoice_screens/detention_invoice.dart';
import 'package:transvision_app1/consignee_Dashboard/consignee_screen/invoice_screens/import_invoice.dart';
import 'package:transvision_app1/consignee_Dashboard/consignee_screen/invoice_screens/security_invoice.dart';
import 'Screen/drawerScreen.dart/BillOfLanding/bill_of_lading.dart';
import 'Screen/drawerScreen.dart/bill_summary.dart';
import 'Screen/drawerScreen.dart/do_slip.dart';
import 'Screen/drawerScreen.dart/loading_list.dart';
import 'Screen/drawerScreen.dart/rate_page.dart';
import 'Screen/drawerScreen.dart/reports.dart';
import 'BottomScreen/contacted_person.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TransVision',
        theme: ThemeData(
            primarySwatch: Colors.orange, primaryColor: AppColor.primaryColor),
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: '/navigation',
        routes: {
          "/login": (context) => const LoginPage(),
          "/splash": (context) => const SplashScreen(),
          "/address": (context) => const AddressPage(),
          "/reset": (context) => const ResetPassword(),
          "/ds": (context) => const DoSlip(),
          "/ll": (context) => const LoadingList(),
          "/bfl": (context) => const BillOfLading(),
          "/reports": (context) => const Reports(),
          "/bs": (context) => const BillSummary(),
          "/bd": (context) => const BookingDetails(),
          "/bd2": (context) => const BookingDetails2(),
          "/contact": (context) => const ContactedPerson(),
          "/home": (context) => const Home(),
          "/navigation": (context) => const MyNavigation(),
          "/rate": (context) => const RatePage(),
          "/consigneeDoSlip": (context) => const ConsigneeDoSlip(),
          "/damageInvoice": (context) => const DamageInvoice(),
          "/detentionInvoice": (context) => const DetentionInvoice(),
          "/importInvoice": (context) => const ImportInvoice(),
          "/securityInvoice": (context) => const SecurityInvoice(),
          "/consigneeBottom": (context) => const ConsigneeBottom(),
        });
  }
}
