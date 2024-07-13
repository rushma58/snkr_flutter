import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  int listedCount = 0;
  int orderedCount = 0;

  String _name = "Rushma Singh";
  String _number = "Add Your Number";

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
    // Simulate a delay for fetching data
    await Future.delayed(const Duration(seconds: 2));

    // This is where you would fetch data from a database in the future.
    // For now, we simulate this with hardcoded values.
    setState(() {
      _name = "Rushma Singh";
      _number = "Add Your Number";
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
                          Text(_name, style: fBlackSemiBold18),
                          Text(_number, style: fBlackRegular14),
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
