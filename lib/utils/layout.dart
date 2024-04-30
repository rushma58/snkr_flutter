import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:snkr_flutter/screen/Cart/CartPage.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/Homepage.dart';
import 'package:snkr_flutter/utils/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;
  List<String>? permissions;

  @override
  void initState() {
    super.initState();
  }

  // Future<void> _getDataFromSharedPref() async {
  //   try {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     permissions = prefs.getStringList('permissions');
  //     setState(() {});
  //   } catch (e) {
  //     print("Error getting data from SharedPreferences: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _getSelectedWidget(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //index: 2,
        key: const ValueKey('bottomNav'),
        height: 60,
        backgroundColor: Colors.transparent,
        color: cBlack,
        //animationDuration: const Duration(milliseconds: 300),
        //buttonBackgroundColor: cGBrown,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.menu_book,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_checkout,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _getSelectedWidget() {
    switch (_selectedIndex) {
      case 0:
        return const Homepage();
      case 1:
        return const Homepage();
      case 2:
        return const CartPage();
      case 3:
        return const Homepage();

      default:
        return const SizedBox();
    }
  }

  bool _hasPermission(String permission) {
    return permissions?.contains(permission) ?? false;
  }
}
