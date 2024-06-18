import 'package:snkr_flutter/feature/product/fetchProduct/api/fetch_product_api.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/response/fetch_product_response.dart';

class FetchProductRepository {
  Future<FetchProductResponse?> fetchProduct() async {
    return FetchProductAPI().fetchProduct();
  }
}
