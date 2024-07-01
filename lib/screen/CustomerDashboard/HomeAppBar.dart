import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/screen/addProduct/add_product_form.dart';
import 'package:snkr_flutter/screen/login/login_screen.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String? token;
  bool isLoggedIn = false;
  String? role;
  bool isBuyer = true;

  @override
  initState() {
    super.initState();
    _getDataFromSharedPref();
  }

  Future<void> _getDataFromSharedPref() async {
    try {
      token = await getStringData('token');
      isLoggedIn = token != null && token!.isNotEmpty;

      if (isLoggedIn) {
        role = await getStringData('role');
        isBuyer = role != "1";
      }

      // debugPrint("Token: $token");
      // debugPrint("Role: $role");
      // debugPrint("isBuyer: $isBuyer");

      setState(() {});
    } catch (e) {
      print("Error getting data from SharedPreferences: $e");
    }
  }

  Future<bool> isTokenValid() async {
    String? token = await getStringData('expiry');
    if (token != null) {
      return !JwtDecoder.isExpired(token);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.to(() => const LoginScreen());
              removeData('token');
              removeData('role');
              removeData('expiry');
            },
            icon: const Icon(
              Icons.logout,
              size: 30,
              color: Colors.black,
            ),
          ),
          Image.asset(
            "assets/icons/main_logo.png",
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          GestureDetector(
            onTap: () async {
              bool isValid = await isTokenValid();
              if (isValid) {
                isBuyer
                    ? customInfoSnackBar("Need to be logged in as a seller")
                    : Get.to(() => const AddProductForm());
              } else {
                customInfoSnackBar(
                    "Need to be logged in to perform this action");
                Get.to(() => const LoginScreen());
              }
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              decoration: const BoxDecoration(
                  color: cBlack,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "Sell",
                style: fWhiteSemiBold16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
