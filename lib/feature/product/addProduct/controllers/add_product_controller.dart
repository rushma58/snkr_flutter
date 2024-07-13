import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/helper/snackBar/snack_bar_helper.dart';
import 'package:snkr_flutter/core/utils/layout.dart';
import 'package:snkr_flutter/feature/product/addProduct/model/add_product_model.dart';
import 'package:snkr_flutter/feature/product/addProduct/repository/add_product_repository.dart';
import 'package:snkr_flutter/feature/product/addProduct/response/add_product_response.dart';

class AddProductController extends GetxController {
  final name_controller = TextEditingController();
  final brand_controller = TextEditingController();
  final model_controller = TextEditingController();
  final category_controller = TextEditingController();
  final size_controller = TextEditingController();
  final color_controller = TextEditingController();
  final price_controller = TextEditingController();
  final discount_price_controller = TextEditingController();
  final commission_controller = TextEditingController();
  final final_price_controller = TextEditingController();
  final description_controller = TextEditingController();
  final material_controller = TextEditingController();
  final sku_controller = TextEditingController();
  final release_date_controller = TextEditingController();
  String? images_controller;
  final weight_controller = TextEditingController();
  final dimensions_controller = TextEditingController();
  final gender_controller = TextEditingController();
  final status_controller = TextEditingController();
  final user_id_controller = TextEditingController();

  final AddProductRepository _addProductRepository = AddProductRepository();
  final isLoading = false.obs;

  void clearControllers() {
    name_controller.clear();
    brand_controller.clear();
    model_controller.clear();
    category_controller.clear();
    size_controller.clear();
    color_controller.clear();
    price_controller.clear();
    discount_price_controller.clear();
    commission_controller.clear();
    final_price_controller.clear();
    description_controller.clear();
    material_controller.clear();
    sku_controller.clear();
    release_date_controller.clear();
    weight_controller.clear();
    dimensions_controller.clear();
    gender_controller.clear();
    status_controller.clear();

    //images_controller = null;
  }

  @override
  void onClose() {
    name_controller.dispose();
    brand_controller.dispose();
    model_controller.dispose();
    category_controller.dispose();
    size_controller.dispose();
    color_controller.dispose();
    price_controller.dispose();
    discount_price_controller.dispose();
    commission_controller.dispose();
    final_price_controller.dispose();
    description_controller.dispose();
    material_controller.dispose();
    sku_controller.dispose();
    release_date_controller.dispose();
    weight_controller.dispose();
    dimensions_controller.dispose();
    gender_controller.dispose();
    status_controller.dispose();

    super.onClose();
  }

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
        price: double.parse(price_controller.text),
        discount_price: 0,
        commission: double.parse(commission_controller.text),
        final_price: double.parse(final_price_controller.text),
        description: description_controller.text,
        material: material_controller.text,
        sku: sku_controller.text,
        release_date: release_date_controller.text,
        images: images_controller,
        weight: double.parse(weight_controller.text),
        dimensions: dimensions_controller.text,
        gender: gender_controller.text,
        status: "in stock",
        // user_id: 19,
      );
      addProductResponse =
          await _addProductRepository.addProduct(addProductModel);
      if (addProductResponse?.success == true) {
        // Clear and dispose controllers
        clearControllers();

        Get.off(() => const LayoutScreen(initial_index: 0));

        customSuccessSnackBar("Product is added successfully");
      } else {
        customErrorSnackBar(
            "Error occurred while adding product. Please try again");
      }
      return addProductResponse;
    } on DioException catch (e) {
      debugPrint("${e.message}");
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
