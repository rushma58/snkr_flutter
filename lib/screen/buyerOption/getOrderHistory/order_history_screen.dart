import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/constants/noData/no_data.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/order/order-buyer/controller/order_history_controller.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/orderHistory/order/order_model.dart';
import 'package:snkr_flutter/screen/buyerOption/addRating/add_rating_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  final String orderStatus;
  final bool? review;
  const OrderHistoryScreen({
    super.key,
    required this.orderStatus,
    this.review,
  });

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  final OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: cWhite),
        child: Obx(() {
          if (orderHistoryController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (orderHistoryController.orderHistoryResponse == null ||
              orderHistoryController.orderHistoryResponse!.orders!.isEmpty) {
            return const Center(child: NoDataPage());
          } else {
            final filteredOrders = orderHistoryController
                .orderHistoryResponse!.orders!
                .where((order) => order.status == widget.orderStatus)
                .toList();

            if (filteredOrders.isEmpty) {
              return const Center(child: NoDataPage());
            }

            return ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                return _buildOrderCard(filteredOrders[index]);
              },
            );
          }
        }),
      ),
    );
  }

  Widget _buildOrderCard(OrderHistoryModel order) {
    return Card(
      color: cGray,
      margin: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        backgroundColor: cGray,
        childrenPadding: const EdgeInsets.all(8),
        title: Text(
          'Order ${order.order_id}',
          style: fBlackRegular16,
        ),
        subtitle: Text(
          'Placed on ${order.order_date}',
          style: fBlackRegular14,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ...order.items!.map((item) => ListTile(
                leading: Image.network(
                  imageBaseUrl + item.images.toString(),
                  width: 100,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  item.name.toString(),
                  style: fBlackRegular14,
                ),
                subtitle: Text(
                  '${item.brand} ',
                  style: fBlackRegular12,
                ),
                trailing: Column(
                  children: [
                    Text(
                      'Rs. ${item.total_price}',
                      style: fBlackRegular12,
                    ),
                    Visibility(
                        visible: widget.review ?? false,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => AddRatingScreen(
                                  item: item,
                                ));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                                color: cGreen,
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              "Review",
                              style: fWhiteRegular12,
                            ),
                          ),
                        )),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text('Total: Rs. ${order.final_price}', style: fRedSemiBold14),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: cBlack.withOpacity(0.5),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            onPressed: () {
              // Implement buy again functionality
            },
            child: const Text(
              'Buy again',
              style: fWhiteSemiBold14,
            ),
          ),
        ],
      ),
    );
  }
}
