import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/constants/noData/no_data.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/widgets/top_nav_bar.dart';

import '../../../../feature/order/seller-order-status/controller/seller_order_status_controller.dart';

class OrderStatusScreen extends StatefulWidget {
  const OrderStatusScreen({super.key});

  @override
  State<OrderStatusScreen> createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  final SellerOrderStatusController sellerOrderStatusController =
      Get.put(SellerOrderStatusController());

  @override
  void initState() {
    super.initState();
    sellerOrderStatusController.sellerOrderStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
          appBarName: "Order Status",
          backFunction: '',
          filterRequired: false,
        ),
      ),
      body: GetBuilder<SellerOrderStatusController>(builder: (controller) {
        if (sellerOrderStatusController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (sellerOrderStatusController.sellerOrderStatusResponse ==
                null ||
            sellerOrderStatusController
                .sellerOrderStatusResponse!.recent_orders!.isEmpty) {
          return const Center(child: NoDataPage());
        } else {
          return ListView.builder(
            itemCount: sellerOrderStatusController
                .sellerOrderStatusResponse!.recent_orders?.length,
            itemBuilder: (context, index) {
              final recentOrder = sellerOrderStatusController
                  .sellerOrderStatusResponse!.recent_orders?[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  // leading: Image.network(
                  //   recentOrder!.images.toString(),
                  //   width: 50,
                  //   height: 50,
                  //   fit: BoxFit.cover,
                  //   errorBuilder: (context, error, stackTrace) =>
                  //       const Icon(Icons.error),
                  // ),
                  title: Text(
                    'Shoe Id: ${recentOrder!.shoe_id.toString()}',
                    style: fBlackSemiBold16,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price: ${recentOrder.total_price.toString()}',
                        style: fBlackRegular14,
                      ),
                      Text(
                        'Status: ${recentOrder.order!.status.toString()}',
                        style: fBlackRegular14,
                      ),
                      // Text(
                      //   'Status: ${recentOrder.status}',
                      //   style: fBlackRegular14,
                      // ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        }
      }),
    );
  }
}
