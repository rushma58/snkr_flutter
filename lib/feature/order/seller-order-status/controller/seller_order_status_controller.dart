import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/repository/seller_order_status_repository.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/response/seller_order_status_response.dart';

class SellerOrderStatusController extends GetxController {
  final SellerOrderStatusRepository _sellerOrderStatusRepository =
      SellerOrderStatusRepository();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  final Rx<SellerOrderStatusResponse?> _sellerOrderStatusResponse =
      Rx<SellerOrderStatusResponse?>(null);
  SellerOrderStatusResponse? get sellerOrderStatusResponse =>
      _sellerOrderStatusResponse.value;

  @override
  void onInit() {
    super.onInit();
    sellerOrderStatus();
  }

  Future<void> sellerOrderStatus() async {
    _isLoading.value = true;
    try {
      SellerOrderStatusResponse? getSellerOrder =
          await _sellerOrderStatusRepository.sellerORderStatus();
      _sellerOrderStatusResponse.value = getSellerOrder;
    } catch (e) {
      debugPrint('Error fetching seller order status: $e');
      _sellerOrderStatusResponse.value = null;
    } finally {
      _isLoading.value = false;
    }
  }
}
