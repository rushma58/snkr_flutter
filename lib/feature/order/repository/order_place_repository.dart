import 'package:snkr_flutter/feature/order/api/order_place_api.dart';
import 'package:snkr_flutter/feature/order/model/orderPlace/order_place_model.dart';
import 'package:snkr_flutter/feature/order/response/order_place_response.dart';

class OrderPlaceRepository {
  Future<OrderPlaceResponse?> placeOrder(
      OrderPlaceModel orderPlaceModel) async {
    return OrderPlaceAPI().placeOrder(orderPlaceModel);
  }
}
