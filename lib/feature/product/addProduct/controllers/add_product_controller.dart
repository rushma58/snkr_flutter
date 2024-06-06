import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/feature/product/addProduct/model/add_product_model.dart';
import 'package:snkr_flutter/feature/product/addProduct/repository/add_product_repository.dart';
import 'package:snkr_flutter/feature/product/addProduct/response/add_product_response.dart';
import 'package:snkr_flutter/screen/login/login_screen.dart';

class AddProductController extends GetxController {
  final name_controller = TextEditingController();
  final brand_controller = TextEditingController();
  final model_controller = TextEditingController();
  final category_controller = TextEditingController();
  final size_controller = TextEditingController();
  final color_controller = TextEditingController();
  final price_controller = TextEditingController();
  final discount_price_controller = TextEditingController();
  final description_controller = TextEditingController();
  final material_controller = TextEditingController();
  final sku_controller = TextEditingController();
  final release_date_controller = TextEditingController();
  final images_controller = TextEditingController();
  final weight_controller = TextEditingController();
  final dimensions_controller = TextEditingController();
  final gender_controller = TextEditingController();
  final status_controller = TextEditingController();
  final user_id_controller = TextEditingController();

  final AddProductRepository _addProductRepository = AddProductRepository();

  final isLoading = false.obs;

  Future<AddProductResponse?> addProduct() async {
    isLoading.value = true;
    try {
      AddProductResponse? addProductResponse;
      final addProductModel = AddProductModel(
        name: name_controller.text,
        brand: brand_controller.text,
        model: model_controller.text,
        category: category_controller.text,
        size: size_controller.text,
        color: color_controller.text,
        price: int.parse(price_controller.text),
        discount_price: int.parse(discount_price_controller.text),
        description: description_controller.text,
        material: material_controller.text,
        sku: sku_controller.text,
        release_date: release_date_controller.text,
        images: images_controller.text,
        weight: double.parse(weight_controller.text),
        dimensions: dimensions_controller.text,
        gender: gender_controller.text,
        status: status_controller.text,
        user_id: int.parse(user_id_controller.text),
      );

      addProductResponse =
          await _addProductRepository.addProduct(addProductModel);

      if (addProductResponse?.success == true) {
        Get.to(() => const LoginScreen());
        // showSnackBar(
        //   registrationResponse?.message ?? 'Registration Successful',
        //   isError: false,
        // );
        customSuccessSnackBar("Product is added successfully");
      } else {
        // showSnackBar(
        //   "Error occurred while registering. Please try again",
        //   isError: true,
        // );
        customErrorSnackBar(
            "Error occurred while adding product. Please try again");
      }

      return addProductResponse;
    } on DioException catch (e) {
      // Handle DioError separately for better debugging
      // showSnackBar(
      //   "Registration Error: ${e.message}",
      //   isError: true,
      // );
      debugPrint("${e.message}");
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
