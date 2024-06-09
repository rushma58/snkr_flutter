import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_model.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/repository/fetch_product_repository.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/response/fetch_product_response.dart';

class FetchProductController extends GetxController {
  final FetchProductRepository _fetchProductRepository =
      FetchProductRepository();
  final _fetchProductResponse = Rx<FetchProductResponse?>(null);
  List<FetchProductModel>? get fetchProduct =>
      _fetchProductResponse.value?.data;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    fetchProductList();
  }

  Future<void> fetchProductList() async {
    _isLoading.value = true;
    try {
      final response = await _fetchProductRepository.fetchProduct();
      _fetchProductResponse.value = response;
    } catch (e) {
      debugPrint('Error fetching appointment list: $e');
    } finally {
      _isLoading.value = false;
    }
  }
}
