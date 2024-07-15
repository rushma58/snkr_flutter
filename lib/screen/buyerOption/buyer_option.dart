import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/widgets/snkr_navbar.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/controller/seller_order_status_controller.dart';
import 'package:snkr_flutter/screen/buyerOption/ChatSystem/chat_system.dart';
import 'package:snkr_flutter/screen/buyerOption/getOrderHistory/order_history_layout.dart';
import 'package:snkr_flutter/screen/compareProduct/product_compare_screen.dart';

import '../../core/widgets/icons/custom_icon_button.dart';

class BuyerOptionScreen extends StatefulWidget {
  const BuyerOptionScreen({super.key});

  @override
  _BuyerOptionScreen createState() => _BuyerOptionScreen();
}

class _BuyerOptionScreen extends State<BuyerOptionScreen> {
  final SellerOrderStatusController sellerOrderStatusController =
      Get.put(SellerOrderStatusController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Icon(Icons.arrow_back),
      //   backgroundColor: Colors.grey.shade200,
      //   elevation: 0,
      // ),
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SnkrNavbar(
            appBarName: "My Profile",
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                CustomIconButton(
                  icon: const Icon(Icons.shopping_bag),
                  icon_name: "My Order",
                  onTap: () {
                    Get.to(const GetMyOrderLayout());
                  },
                ),
                CustomIconButton(
                  icon: const Icon(Icons.compare_arrows),
                  icon_name: "Compare Shoe",
                  onTap: () {
                    Get.to(const ProductCompareScreen());
                  },
                ),
                CustomIconButton(
                  icon: const Icon(Icons.chat),
                  icon_name: "Chat",
                  onTap: () {
                    Get.to(const SupportPage());
                  },
                ),
                CustomIconButton(
                  icon: const Icon(Icons.route),
                  icon_name: "Track My Order",
                  onTap: () {},
                ),
                CustomIconButton(
                  icon: const Icon(Icons.reviews),
                  icon_name: "My Review",
                  onTap: () {
                    // Get.to(const GetMyOrderLayout());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 36),
        const SizedBox(height: 8),
        Text(label, textAlign: TextAlign.center),
      ],
    );
  }
}
