import 'package:snkr_flutter/feature/product/fetchProduct/api/fetch_product_api.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/response/fetch_product_response.dart';

import '../model/fetch_product_params_model.dart';

class FetchProductRepository {
  Future<FetchProductResponse?> fetchProduct(
      FetchProductParamsModel fetchProductParamsModel) async {
    return FetchProductAPI().fetchProduct(fetchProductParamsModel);
  }
}
