import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/helper/sharedPreferences/shared_preferences.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/controller/seller_order_status_controller.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/HomeAppBar.dart';

class SellerHomepage extends StatefulWidget {
  const SellerHomepage({super.key});

  @override
  _SellerHomepage createState() => _SellerHomepage();
}

class _SellerHomepage extends State<SellerHomepage> {
  final SellerOrderStatusController sellerOrderStatusController =
      Get.put(SellerOrderStatusController());
  String? first_name = "";
  String? last_name = "";
  String? contact_number = "";

  int listedCount = 0;
  int orderedCount = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    sellerOrderStatusController.sellerOrderStatus();
  }

  void processProductData() {
    listedCount = 0;
    orderedCount = 0;

    final response = sellerOrderStatusController.sellerOrderStatusResponse;
    if (response != null && response.products != null) {
      for (var product in response.products!) {
        if (product.status == 'Not ordered yet') {
          listedCount++;
        } else if (product.status == 'Order placed') {
          orderedCount++;
        }
      }
    }
  }

  Future<void> _fetchUserData() async {
    await Future.delayed(const Duration(seconds: 2));
    first_name = await getStringData('first_name');
    last_name = await getStringData('last_name');
    contact_number = await getStringData('contact_number');

    setState(() {
      first_name = first_name;
      last_name = last_name;
      contact_number = contact_number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: HomeAppBar()),
        body: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: cWhite,
                        radius: 24,
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("$first_name $last_name",
                              style: fBlackSemiBold18),
                          Text("$contact_number", style: fBlackRegular14),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GetBuilder<SellerOrderStatusController>(builder: (controller) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                processProductData();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Products Summary',
                            style: fBlackSemiBold18,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('$listedCount', style: fBlackSemiBold20),
                                  const Text('Listed', style: fBlackRegular16),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('$orderedCount',
                                      style: fBlackSemiBold20),
                                  const Text('Ordered', style: fBlackRegular16),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            }),
          ],
        ));
  }
}
