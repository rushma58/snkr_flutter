import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_model.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_params_model.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/repository/fetch_product_repository.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/response/fetch_product_response.dart';

class FetchProductController extends GetxController {
  final name_controller = TextEditingController();
  final brand_controller = TextEditingController();
  final category_controller = TextEditingController();
  final min_price_controller = TextEditingController();
  final max_price_controller = TextEditingController();
  final FetchProductRepository _fetchProductRepository =
      FetchProductRepository();
  final _fetchProductResponse = Rx<FetchProductResponse?>(null);
  List<FetchProductModel>? get fetchProduct =>
      _fetchProductResponse.value?.data;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // Add this for search results
  final _searchResults = Rx<List<FetchProductModel>>([]);
  List<FetchProductModel> get searchResults => _searchResults.value;

  @override
  void onClose() {
    name_controller.clear();
    brand_controller.clear();
    category_controller.clear();
    min_price_controller.clear();
    max_price_controller.clear();

    name_controller.dispose();
    brand_controller.dispose();
    category_controller.dispose();
    min_price_controller.dispose();
    max_price_controller.dispose();

    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }

  Future<void> fetchProductList() async {
    _isLoading.value = true;
    try {
      final fetchProductParamsModel = FetchProductParamsModel(
        name: name_controller.text,
        brand: brand_controller.text,
        category: category_controller.text,
        min_price: min_price_controller.text,
        max_price: max_price_controller.text,
      );

      final response =
          await _fetchProductRepository.fetchProduct(fetchProductParamsModel);
      _fetchProductResponse.value = response;
    } catch (e) {
      debugPrint('Error fetching product list: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  // Add this method for searching products
  Future<void> searchProducts(String query) async {
    _isLoading.value = true;
    try {
      final fetchProductParamsModel = FetchProductParamsModel(
        name: name_controller.text,
        brand: brand_controller.text,
        category: category_controller.text,
        min_price: min_price_controller.text,
        max_price: max_price_controller.text,
      );

      final response =
          await _fetchProductRepository.fetchProduct(fetchProductParamsModel);
      if (response != null && response.data != null) {
        _searchResults.value = response.data!;
      } else {
        _searchResults.value = [];
      }
    } catch (e) {
      debugPrint('Error searching products: $e');
      _searchResults.value = [];
    } finally {
      _isLoading.value = false;
    }
  }
}
