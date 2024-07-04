import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/repository/seller_order_status_repository.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/response/seller_order_status_response.dart';

class SellerOrderStatusController extends GetxController {
  final SellerOrderStatusRepository _sellerOrderStatusRepository =
      SellerOrderStatusRepository();

  bool isLoading = false;

  final _sellerOrderStatusResponse = Rx<SellerOrderStatusResponse?>(null);
  SellerOrderStatusResponse? get sellerOrderStatusResponse =>
      _sellerOrderStatusResponse.value;

  Future<void> sellerOrderStatus() async {
    isLoading = true;
    update();
    try {
      SellerOrderStatusResponse? getSellerOrder =
          await _sellerOrderStatusRepository.sellerORderStatus();
      _sellerOrderStatusResponse.value = getSellerOrder;
    } catch (e) {
      debugPrint('Error fetching seller order status: $e');
      _sellerOrderStatusResponse.value =
          null; // Ensure it's set to null on error
    } finally {
      isLoading = false;
      update(); // Notify listeners that the state has changed
    }
  }
}
