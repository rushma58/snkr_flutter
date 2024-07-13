import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/layout.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const route = 'splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    // _getDataFromSharedPref();
    Timer(
      const Duration(seconds: 1),
      () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const LoginOrRegistrationScreen(),
        //   ),
        // );
        Get.off(const LayoutScreen(
          initial_index: 0,
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Container(
            child: Image.asset(
              'assets/icons/main_logo.png',
              height: 400,
            ),
          ),
        ),
      ),
    );
  }

  // _getDataFromSharedPref() async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     final String? tokenValue = prefs.getString('token');
  //     final String? expireInDateValue = prefs.getString('expire_in_date');

  //     debugPrint("Token in Splash page: $tokenValue");
  //     debugPrint("Expire Date in Splash page: $expireInDateValue");

  //     if (tokenValue != null && expireInDateValue != null) {
  //       final storedExpireDate = DateTime.parse(expireInDateValue);
  //       final currentDate = DateTime.now();

  //       if (currentDate.isBefore(storedExpireDate)) {
  //         setState(() {
  //           isLoggedIn = true;
  //         });
  //       } else {
  //         setState(() {
  //           isLoggedIn = false;
  //           debugPrint("Token is expired in splash screen");
  //         });
  //       }
  //     } else {
  //       setState(() {
  //         isLoggedIn = false;
  //         debugPrint("No data found in splash screen");
  //       });
  //     }
  //   } catch (e) {
  //     debugPrint("Error getting data from SharedPreferences: $e");
  //   }
  // }
}
