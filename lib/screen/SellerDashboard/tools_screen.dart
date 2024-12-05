import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/constants/noData/under_development.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/widgets/snkr_navbar.dart';
import 'package:snkr_flutter/screen/SellerDashboard/addProduct/add_product_form.dart';
import 'package:snkr_flutter/screen/SellerDashboard/tools/orderStatus/order_status_layout.dart';

import '../../core/widgets/icons/custom_icon_button.dart';
import 'tools/productDetails/product_detail_screen.dart';

class ToolsScreenPage extends StatefulWidget {
  const ToolsScreenPage({super.key});

  @override
  _ToolsScreenPage createState() => _ToolsScreenPage();
}

class _ToolsScreenPage extends State<ToolsScreenPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SnkrNavbar(
          appBarName: "Tools",
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: cWhite),
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            CustomIconButton(
              icon: const Icon(Icons.info),
              icon_name: "Product Details",
              onTap: () {
                Get.to(const ProductDetailScreen());
              },
            ),
            CustomIconButton(
              icon: const Icon(Icons.checklist),
              icon_name: "Order Status",
              onTap: () {
                Get.to(const OrderStatusLayout());
              },
            ),
            CustomIconButton(
              icon: const Icon(Icons.add_circle),
              icon_name: "Add new Product",
              onTap: () {
                Get.to(const AddProductForm());
              },
            ),
            CustomIconButton(
              icon: const Icon(Icons.verified),
              icon_name: "Authentic Check",
              onTap: () {
                Get.to(const UnderDevelopmentPage());
              },
            ),
            CustomIconButton(
              icon: const Icon(Icons.payment),
              icon_name: "Payments",
              onTap: () {
                Get.to(const UnderDevelopmentPage());
              },
            ),
          ],
        ),
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
