import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/layout.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/orderPlace/order_place_model.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/payment/payment_model.dart';
import 'package:snkr_flutter/feature/order/order-buyer/repository/order_place_repository.dart';
import 'package:snkr_flutter/feature/order/order-buyer/response/order_place_response.dart';

import '../../../../core/helper/snackBar/snack_bar_helper.dart';
import '../model/selectedItem/selected_shoe_model.dart';

class OrderPlaceController extends GetxController {
  final total_price_controller = TextEditingController();
  final delivery_price_controller = TextEditingController();
  final final_price_controller = TextEditingController();
  final delivery_location_controller = TextEditingController();
  final remarks_controller = TextEditingController();

  final OrderPlaceRepository _orderPlaceRepository = OrderPlaceRepository();
  // final isLoading = false.obs;

  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  final RxList<SelectedShoeModel> orderItems = <SelectedShoeModel>[].obs;

  void addOrderItem(SelectedShoeModel item) {
    orderItems.add(item);
  }

  void clearOrderItems() {
    orderItems.clear();
  }

  Future<OrderPlaceResponse?> placeOrder() async {
    isLoading.value = true;
    update();
    try {
      OrderPlaceResponse? orderPlaceResponse;

      final paymentDetails = PaymentModel(
        method: "Test Method",
        transaction_id: "123",
      );

      final orderPlaceModel = OrderPlaceModel(
        total_price: double.parse(total_price_controller.text),
        delivery_price: double.parse(delivery_price_controller.text),
        final_price: double.parse(final_price_controller.text),
        delivery_location: delivery_location_controller.text,
        remarks: "Test",
        payment_details: paymentDetails,
        items: orderItems.toList(),
      );

      orderPlaceResponse =
          await _orderPlaceRepository.placeOrder(orderPlaceModel);
      if (orderPlaceResponse != null && orderPlaceResponse.success == true) {
        Get.to(const LayoutScreen(
          initial_index: 0,
        ));
        customSuccessSnackBar("Order is placed.");
      } else {
        customErrorSnackBar(
            "Error occurred while placing order. Please try again");
      }
    } on DioException catch (e) {
      debugPrint("${e.message}");
      return null;
    } finally {
      isLoading.value = false;
      update();
    }
    return null;
  }
}
