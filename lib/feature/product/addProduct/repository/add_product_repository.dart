import 'package:snkr_flutter/feature/product/addProduct/api/add_product_api.dart';
import 'package:snkr_flutter/feature/product/addProduct/model/add_product_model.dart';
import 'package:snkr_flutter/feature/product/addProduct/response/add_product_response.dart';

class AddProductRepository {
  Future<AddProductResponse?> addProduct(
      AddProductModel addProductModel) async {
    return AddProductAPI().addProduct(addProductModel);
  }
}
