import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/controller/fetch_product_controller.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/MostPopular.dart';

import '../../core/utils/colors.dart';
import '../../core/widgets/top_nav_bar.dart';

class SearchResultsPage extends StatelessWidget {
  final String searchQuery;

  const SearchResultsPage({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<FetchProductController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
          appBarName: 'Search Results for "$searchQuery"',
          filterRequired: true,
          backFunction: '',
          onPressedFilter: () {},
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              if (productController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of items per row
                    crossAxisSpacing: 5, // Spacing between items horizontally
                    mainAxisSpacing: 5, // Spacing between items vertically
                    childAspectRatio: 0.9, // Aspect ratio of each item
                  ),
                  itemCount: productController.searchResults.length,
                  itemBuilder: (context, index) {
                    final product = productController.searchResults[index];
                    return MostPopular(product: product);
                  },
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}
