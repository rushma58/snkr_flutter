import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repository/order_history_repository.dart';
import '../response/order_history_response.dart';

class OrderHistoryController extends GetxController {
  final OrderHistoryRepository _orderHistoryRepository =
      OrderHistoryRepository();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final Rx<OrderHistoryResponse?> _orderHistoryResponse =
      Rx<OrderHistoryResponse?>(null);
  OrderHistoryResponse? get orderHistoryResponse => _orderHistoryResponse.value;

  @override
  void onInit() {
    super.onInit();
    orderHistory();
  }

  Future<void> orderHistory() async {
    _isLoading.value = true;
    try {
      OrderHistoryResponse? getOrderHistory =
          await _orderHistoryRepository.orderHistory();
      _orderHistoryResponse.value = getOrderHistory;
    } catch (e) {
      debugPrint('Error fetching seller order status: $e');
      _orderHistoryResponse.value = null;
    } finally {
      _isLoading.value = false;
    }
  }
}
