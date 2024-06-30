import 'package:snkr_flutter/feature/cart/api/add_to_cart_api.dart';
import 'package:snkr_flutter/feature/cart/response/addToCart/add_to_cart_response.dart';
import 'package:snkr_flutter/feature/cart/response/getCart/get_cart_response.dart';

import '../response/deleteCart/delete_cart_response.dart';

class CartRepository {
  Future<AddToCartResponse?> addToCart(String shoeId) async {
    return CartAPI().addToCart(shoeId);
  }

  Future<GetCartResponse?> getCart() async {
    return CartAPI().getCart();
  }

  Future<DeleteCartResponse?> deleteCart(String id) async {
    return CartAPI().deleteCart(id);
  }
}
