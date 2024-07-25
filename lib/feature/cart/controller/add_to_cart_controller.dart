import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/feature/cart/response/addToCart/add_to_cart_response.dart';
import 'package:snkr_flutter/feature/cart/response/getCart/get_cart_response.dart';

import '../../../core/helper/snackBar/snack_bar_helper.dart';
import '../model/getCart/get_cart_model.dart';
import '../repository/add_to_cart_repository.dart';
import '../response/deleteCart/delete_cart_response.dart';

class CartController extends GetxController {
  final shoe_id_controller = TextEditingController();

  final cart_id_controller = TextEditingController();

  final CartRepository _cartRepository = CartRepository();
  // final isLoading = false.obs;

  bool isLoading = false;

  final _getCartResponse = Rx<GetCartResponse?>(null);
  List<GetCartModel>? get getCartList => _getCartResponse.value?.data;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    shoe_id_controller.clear();
    cart_id_controller.clear();

    shoe_id_controller.dispose();
    cart_id_controller.dispose();
  }

  Future<AddToCartResponse?> addToCart() async {
    isLoading = true;
    update();
    try {
      AddToCartResponse? addToCartResponse;
      String shoeId = shoe_id_controller.text;

      addToCartResponse = await _cartRepository.addToCart(shoeId);
      if (addToCartResponse?.success == true) {
        customSuccessSnackBar("Product is added to cart successfully");
      } else {
        customErrorSnackBar(
            "Error occurred while adding product to cart. Please try again");
      }
    } on DioException catch (e) {
      debugPrint("${e.message}");
      return null;
    } finally {
      isLoading = false;
      update();
    }
    return null;
  }

  Future<void> getCart() async {
    isLoading = true;
    update();
    try {
      GetCartResponse? getCartResponse = await _cartRepository.getCart();
      _getCartResponse.value = getCartResponse;
    } catch (e) {
      debugPrint('Error fetching product list: $e');
      _getCartResponse.value = null; // Ensure it's set to null on error
    } finally {
      isLoading = false;
      update(); // Notify listeners that the state has changed
    }
  }

  Future<DeleteCartResponse?> deleteCart() async {
    isLoading = true;
    update();
    try {
      DeleteCartResponse? deleteCartResponse;

      String id = cart_id_controller.text;
      deleteCartResponse = await _cartRepository.deleteCart(id);

      if (deleteCartResponse?.success == true) {
        await getCart();
        customSuccessSnackBar("Product is deleted successfully");
      } else {
        customErrorSnackBar(
            "Error occurred while deleting product from cart. Please try again");
      }
    } catch (e) {
      debugPrint('Error deleting cart list: $e');
    } finally {
      isLoading = false;
      update();
    }
    return null;
  }
}
