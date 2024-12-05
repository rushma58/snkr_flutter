import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/constants/noData/no_data.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/widgets/top_nav_bar.dart';

import '../../../../core/helper/api/url_services.dart';
import '../../../../feature/order/seller-order-status/controller/seller_order_status_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final SellerOrderStatusController sellerOrderStatusController =
      Get.put(SellerOrderStatusController());

  @override
  void initState() {
    super.initState();
    sellerOrderStatusController.sellerOrderStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
          appBarName: "Product Details",
          backFunction: '',
          filterRequired: false,
        ),
      ),
      body: GetBuilder<SellerOrderStatusController>(builder: (controller) {
        // if (sellerOrderStatusController.isLoading) {
        //   return const Center(child: CircularProgressIndicator());
        // } else
        if (sellerOrderStatusController.sellerOrderStatusResponse == null ||
            sellerOrderStatusController
                .sellerOrderStatusResponse!.products!.isEmpty) {
          return const Center(child: NoDataPage());
        } else {
          return ListView.builder(
            itemCount: sellerOrderStatusController
                .sellerOrderStatusResponse!.products?.length,
            itemBuilder: (context, index) {
              final product = sellerOrderStatusController
                  .sellerOrderStatusResponse!.products?[index];
              return Card(
                margin: const EdgeInsets.all(5.0),
                child: ListTile(
                  leading: Image.network(
                    // product!.images.toString(),
                    (imageBaseUrl + product!.images.toString()),
                    width: 50,
                    height: 50,
                    fit: BoxFit.fitWidth,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error),
                  ),
                  title: Text(
                    product.name.toString(),
                    style: fBlackSemiBold16,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price deducting commission: Rs. ${product.price}',
                        style: fBlackRegular14,
                      ),
                      Text(
                        'Status: ${product.status}',
                        style: fBlackRegular14,
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        }
      }),
    );
  }
}
