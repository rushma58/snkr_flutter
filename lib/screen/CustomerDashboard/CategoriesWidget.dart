import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

import '../../feature/product/fetchProduct/controller/fetch_product_controller.dart';
import '../Item/searched_item.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  // Variable to track the selected container index
  int selectedIndex = -1;
  final productController = Get.put(FetchProductController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildCategoryContainer("Nike", 1),
          buildCategoryContainer("Adidas", 2),
          buildCategoryContainer("New Balance", 3),
          buildCategoryContainer("Puma", 4),
          buildCategoryContainer("Jordan", 5),
          buildCategoryContainer("Converse", 6),
        ],
      ),
    );
  }

  // Function to build each category container
  Widget buildCategoryContainer(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // Update the selected index
          selectedIndex = index;
          productController.name_controller.text = "";
          productController.brand_controller.text = text;
          productController.searchProducts(text);
          Get.to(() => SearchResultsPage(
                searchQuery: text.toString(),
              ));
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.grey : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Row(
          children: [
            Text(
              text,
              style: fBlackSemiBold14,
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Selectable Categories'),
      ),
      body: const CategoriesWidget(),
    ),
  ));
}
