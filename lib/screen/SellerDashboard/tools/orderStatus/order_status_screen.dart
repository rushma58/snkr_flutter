import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/constants/noData/no_data.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

import '../../../../core/constants/orderStatus.dart';
import '../../../../core/utils/colors.dart';
import '../../../../feature/order/seller-order-status/controller/seller_order_status_controller.dart';

class OrderStatusScreen extends StatelessWidget {
  final String orderStatus;
  OrderStatusScreen({super.key, required this.orderStatus});

  final SellerOrderStatusController sellerOrderStatusController =
      Get.put(SellerOrderStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
          ),
          Obx(() {
            if (sellerOrderStatusController.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (sellerOrderStatusController.sellerOrderStatusResponse ==
                    null ||
                sellerOrderStatusController
                    .sellerOrderStatusResponse!.recent_orders!.isEmpty) {
              return const Center(child: NoDataPage());
            } else {
              final filteredOrders = sellerOrderStatusController
                  .sellerOrderStatusResponse!.recent_orders!
                  .where((order) => order.order!.status == orderStatus)
                  .toList();

              if (filteredOrders.isEmpty) {
                return const Center(child: NoDataPage());
              }

              return ListView.builder(
                itemCount: filteredOrders.length,
                itemBuilder: (context, index) {
                  final recentOrder = filteredOrders[index];
                  return _buildOrderCard(recentOrder);
                },
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildOrderCard(dynamic recentOrder) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: cGray,
        title: Text(
          recentOrder.shoe_name.toString(),
          style: fBlackSemiBold16,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status: ${getOrderStatus(recentOrder.order!.status)}',
              style: fBlackRegular14,
            ),
            Text(
              'Price: ${recentOrder.total_price.toString()}',
              style: fRedSemiBold14,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.update,
                color: cWhite,
              ),
              label: const Text(
                "Update",
                style: fWhiteSemiBold12,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: cBlack,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ],
        ),
        isThreeLine: true,
      ),
    );
  }
}
