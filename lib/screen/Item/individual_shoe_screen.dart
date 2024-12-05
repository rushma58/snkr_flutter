import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/emojione_monotone.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/feature/cart/controller/add_to_cart_controller.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/selectedItem/selected_shoe_model.dart';
import 'package:snkr_flutter/feature/product/addProduct/response/add_product_model_response.dart';
import 'package:snkr_flutter/feature/product/fetchProduct/model/fetch_product_model.dart';
import 'package:snkr_flutter/feature/rating/addRating/controllers/rating_controller.dart';
import 'package:snkr_flutter/feature/rating/viewRating/model/rating_model.dart';
import 'package:snkr_flutter/screen/Cart/proceedToPurchase/purchase_page.dart';

import '../../core/helper/api/url_services.dart';
import '../../core/helper/sharedPreferences/shared_preferences.dart';
import '../../core/helper/snackBar/snack_bar_helper.dart';
import '../../core/widgets/top_nav_bar.dart';

class IndividualShoeScreen extends StatefulWidget {
  final FetchProductModel individualProduct;

  const IndividualShoeScreen({super.key, required this.individualProduct});

  @override
  State<IndividualShoeScreen> createState() => _IndividualShoeScreenState();
}

class _IndividualShoeScreenState extends State<IndividualShoeScreen> {
  late bool isWishlisted = false;

  RatingController ratingController = Get.put(RatingController());

  late CartController cartController;

  @override
  void initState() {
    super.initState();
    cartController = Get.put(CartController());
    _loadRatings();
  }

  Future<bool> isTokenValid() async {
    String? token = await getStringData('expiry');
    if (token != null) {
      return !JwtDecoder.isExpired(token);
    }
    return false;
  }

  List<SelectedShoeModel> get selectedItems {
    return [
      SelectedShoeModel(
        shoe_id: widget.individualProduct.shoe_id,
        quantity: 1,
        unit_price:
            double.parse(widget.individualProduct.final_price.toString()),
        total_price:
            double.parse(widget.individualProduct.final_price.toString()),
        cartId: 0,
      )
    ];
  }

  List<AddProductModelResponse> get selectedItemsDetails {
    return [
      AddProductModelResponse(
        shoe_id: widget.individualProduct.shoe_id,
        name: widget.individualProduct.name,
        brand: widget.individualProduct.brand,
        model: widget.individualProduct.model,
        category: widget.individualProduct.category,
        size: widget.individualProduct.size,
        color: widget.individualProduct.color,
        price: widget.individualProduct.price,
        discount_price: widget.individualProduct.discount_price,
        commission: widget.individualProduct.commission,
        final_price: widget.individualProduct.final_price,
        description: widget.individualProduct.description,
        material: widget.individualProduct.material,
        sku: widget.individualProduct.sku,
        release_date: widget.individualProduct.release_date,
        images: widget.individualProduct.images,
        weight: widget.individualProduct.weight,
        dimensions: widget.individualProduct.dimensions,
        gender: widget.individualProduct.gender,
        status: widget.individualProduct.status,
        user_id: widget.individualProduct.user_id,
      )
    ];
  }

  void _loadRatings() {
    ratingController.shoe_id_controller.text =
        widget.individualProduct.shoe_id.toString();
    ratingController.getRating();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
            appBarName: "Individual Shoe",
            filterRequired: false,
            backFunction: ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      //margin: const EdgeInsets.all(10),
                      child: Image.network(
                        (imageBaseUrl +
                            widget.individualProduct.images.toString()),
                        height: 300,
                        // width: 100,
                        fit: BoxFit.fitWidth,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Center(
                            child: Iconify(
                              EmojioneMonotone.running_shoe,
                              size: Get.width * 0.7,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    widget.individualProduct.name.toString(),
                    style: fBlackSemiBold30,
                  ),
                  Text(
                    widget.individualProduct.sku.toString(),
                    style: fBlackRegular16,
                  ),
                  Text(
                    "Rs. ${widget.individualProduct.final_price}",
                    style: fRedSemiBold16,
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Product Description: ",
                        style: fBlackSemiBold18,
                      ),
                      Text(
                        widget.individualProduct.description.toString(),
                        style: fBlackRegular14,
                      )
                    ],
                  ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Material Used: ",
                        style: fBlackSemiBold18,
                      ),
                      Text(
                        widget.individualProduct.material.toString(),
                        style: fBlackRegular14,
                      )
                    ],
                  ),
                  const Divider(),
                  _buildReviewSection(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            // Positioned(
            //   top: 10,
            //   right: 10,
            //   child: Column(
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           setState(() {
            //             isWishlisted = !isWishlisted;
            //           });
            //         },
            //         icon: Iconify(
            //           isWishlisted ? Mdi.heart : Mdi.heart_outline,
            //           size: 30,
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () {},
            //         icon: const Iconify(MaterialSymbols.shopping_cart_outline,
            //             size: 30),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              heroTag: "buy_now_tag",
              onPressed: () async {
                bool isValid = await isTokenValid();
                if (isValid) {
                  Get.to(() => PurchasePage(
                        selectedItems: selectedItems,
                        selectedShoeDetails: selectedItemsDetails,
                      ));
                } else {
                  customInfoSnackBar(
                      "Your session has expired. Please log in again.");
                }
              },
              label: const Text(
                "Buy Now",
                style: fBlackRegular14,
              ),
              icon: const Iconify(MaterialSymbols.shopping_cart_outline),
              backgroundColor: cSilver,
            ),
            GetBuilder<CartController>(
              builder: (controller) {
                return FloatingActionButton.extended(
                  heroTag: "add_to_cart_tag",
                  onPressed: cartController.isLoading
                      ? null
                      : () async {
                          bool isValid = await isTokenValid();
                          if (isValid) {
                            cartController.shoe_id_controller.text =
                                widget.individualProduct.shoe_id.toString();
                            await cartController.addToCart();
                          } else {
                            customInfoSnackBar(
                                "Your session has expired. Please log in again.");
                          }
                        },
                  label: const Text(
                    "Add to Cart",
                    style: fBlackRegular14,
                  ),
                  icon: const Iconify(MaterialSymbols.shopping_cart_outline),
                  backgroundColor: cSilver,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewSection() {
    return GetBuilder<RatingController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          // final ratingResponse = controller._getRatingResponse.value;
          final averageRating = controller.averageRating;
          final ratingCount = controller.ratingCount;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Reviews",
                style: fBlackSemiBold18,
              ),
              const SizedBox(height: 8),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: fBlackSemiBold24,
                  ),
                  const SizedBox(width: 8),
                  _buildStarRating(averageRating),
                  const SizedBox(width: 8),
                  Text(
                    "($ratingCount reviews)",
                    style: fBlackRegular14,
                  ),
                ],
              ),
              //const SizedBox(height: 16),
              ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: controller.getRatingList?.length ?? 0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final rating = controller.getRatingList![index];
                  return _buildReviewItem(rating);
                },
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildReviewItem(RatingModel rating) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(rating.user!.first_name ?? "Anonymous",
                  style: fBlackSemiBold16),
              _buildStarRating(rating.rating ?? 0.0),
            ],
          ),
          const SizedBox(height: 8),
          Text(rating.review_text ?? "", style: fBlackRegular14),
          const SizedBox(height: 8),
          Text(rating.created_at ?? "", style: fGrayRegular12),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 20,
        );
      }),
    );
  }
}
