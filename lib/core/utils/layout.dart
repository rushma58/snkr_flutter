import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/screen/Cart/CartPage.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/Homepage.dart';
import 'package:snkr_flutter/screen/SellerDashboard/SellerHomepage.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  String? token;
  String? role;
  bool isLoggedIn = false;
  bool isBuyer = true;

  @override
  void initState() {
    super.initState();
    _getDataFromSharedPref();
  }

  Future<void> _getDataFromSharedPref() async {
    try {
      token = await getStringData('token');
      debugPrint("Token in Layout: $token ");
      isLoggedIn = token != null && token!.isNotEmpty;

      if (isLoggedIn) {
        role = await getStringData('role');

        isBuyer = role != "1";
      }

      debugPrint("Token: $token");
      debugPrint("Role: $role");
      debugPrint("isBuyer: $isBuyer");

      setState(() {});
    } catch (e) {
      print("Error getting data from SharedPreferences: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getSelectedWidget(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: const ValueKey('bottomNav'),
        height: 60,
        backgroundColor: Colors.transparent,
        color: cBlack,
        onTap: (index) {
          _handleNavigation(index);
        },
        items: [
          Icon(
            isBuyer ? Icons.home : Icons.sell,
            size: 30,
            color: Colors.white,
          ),
          Iconify(
            isBuyer
                ? MaterialSymbols.compare_arrows
                : MaterialSymbols.check_circle,
            color: cWhite,
            size: 30,
          ),
          Iconify(
            isBuyer
                ? MaterialSymbols.shopping_cart
                : MaterialSymbols.add_circle,
            color: cWhite,
            size: 30,
          ),
          const Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void _handleNavigation(int index) {
    if (isLoggedIn) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginPage()),
      // );

      customInfoSnackBar("Need to be logged in to perform this action");
    }
  }

  Widget _getSelectedWidget() {
    // if (!isLoggedIn) {
    //   return const LoginScreen();
    // }

    switch (_selectedIndex) {
      case 0:
        return isBuyer ? const Homepage() : const SellerHomepage();
      case 1:
        return isBuyer ? const Homepage() : const SellerHomepage();
      case 2:
        return const CartPage();
      case 3:
        return isBuyer ? const Homepage() : const SellerHomepage();
      default:
        return const SizedBox();
    }
  }
}
