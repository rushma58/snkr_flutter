import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/CategoriesWidget.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/HomeAppBar.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/LatestSneakers.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/MostPopular.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/Recommended.dart';
import 'package:snkr_flutter/screen/CustomerDashboard/TopRated.dart';

import '../../feature/product/fetchProduct/controller/fetch_product_controller.dart';
import '../Item/searched_item.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(FetchProductController());
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeAppBar(),
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  )),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 1, // Spread radius
                          blurRadius: 2, // Blur radius
                          offset: const Offset(0, 2), // Shadow position, (x,y)
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          height: 50,
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          child: TextFormField(
                            controller: searchController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search here...",
                            ),
                            onFieldSubmitted: (value) {
                              if (value.isNotEmpty) {
                                productController.name_controller.text = value;
                                productController.searchProducts(value);
                                Get.to(
                                  () => SearchResultsPage(
                                    searchQuery: value.toString(),
                                  ),
                                );
                                searchController.clear();
                              }
                            },
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),

                  //CATEGORIES

                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text(
                          "Brands",
                          style: fBlackSemiBold20,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text(
                          "View All",
                          style: fBlueSemiBold14,
                        ),
                      ),
                    ],
                  ),

                  const CategoriesWidget(),

                  //ITEMS

                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Most Popular",
                          style: fBlackSemiBold20,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        child: const Text(
                          "View All",
                          style: fBlueSemiBold14,
                        ),
                      ),
                    ],
                  ),

                  Obx(
                    () {
                      if (productController.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Number of items per row
                              crossAxisSpacing:
                                  5, // Spacing between items horizontally
                              mainAxisSpacing:
                                  5, // Spacing between items vertically
                              childAspectRatio:
                                  0.9, // Aspect ratio of each item
                            ),
                            itemCount: productController.fetchProduct!.length,
                            itemBuilder: (context, index) {
                              final shoe =
                                  productController.fetchProduct![index];
                              return MostPopular(
                                product: shoe,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  // const MostPopular(),

                  /////RECOMMENDED

                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text("Recommended",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text("View All",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                      ),
                    ],
                  ),

                  const Recommended(),

                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text("Latest Sneakers",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text("View All",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                      ),
                    ],
                  ),

                  const LatestSneakers(),

                  /////////TOP RATED

                  Row(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text("Top Rated",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                      const Spacer(),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: const Text("View All",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            )),
                      ),
                    ],
                  ),

                  const TopRated(),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   backgroundColor: Colors.transparent,
      //   color: Colors.black,
      //   height: 75,
      //   items: const [
      //     Icon(
      //       Icons.home,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.menu_book,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.shopping_cart_checkout,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //     Icon(
      //       Icons.person,
      //       size: 30,
      //       color: Colors.white,
      //     ),
      //   ],
      // ),
    );
  }
}
