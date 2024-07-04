import 'package:snkr_flutter/feature/order/seller-order-status/api/seller_order_status_api.dart';
import 'package:snkr_flutter/feature/order/seller-order-status/response/seller_order_status_response.dart';

class SellerOrderStatusRepository {
  Future<SellerOrderStatusResponse?> sellerORderStatus() async {
    return SellerOrderStatusAPI().sellerORderStatus();
  }
}
