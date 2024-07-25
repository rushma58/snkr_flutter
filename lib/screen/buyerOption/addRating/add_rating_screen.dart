import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/widgets/top_nav_bar.dart';
import 'package:snkr_flutter/feature/order/order-buyer/model/orderHistory/orderedItem/ordered_item_model.dart';
import 'package:snkr_flutter/feature/rating/addRating/controllers/rating_controller.dart';

class AddRatingScreen extends StatefulWidget {
  final OrderedItemModel item;
  const AddRatingScreen({super.key, required this.item});

  @override
  State<AddRatingScreen> createState() => _AddRatingScreenState();
}

class _AddRatingScreenState extends State<AddRatingScreen> {
  double _rating = 0;
  RatingController ratingController = Get.put(RatingController());
  final TextEditingController _reviewController = TextEditingController();

  String getRatingText(double rating) {
    if (rating == 0) return "Tap to rate";
    if (rating <= 1) return "Poor";
    if (rating <= 2) return "Fair";
    if (rating <= 3) return "Good";
    if (rating <= 4) return "Very Good";
    return "Excellent";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
            appBarName: "Review", filterRequired: false, backFunction: ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  imageBaseUrl + widget.item.images.toString(),
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(
                widget.item.name.toString(),
                style: fBlackRegular14,
              ),
              subtitle: Text(
                '${widget.item.brand} ',
                style: fBlackRegular12,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                  ratingController.rating_controller.text = rating.toString();
                });
              },
            ),
            const SizedBox(height: 16),
            Text(
              getRatingText(_rating),
              style: fBlackSemiBold16,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: ratingController.review_text_controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your review here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),
            GetBuilder<RatingController>(
              builder: (controller) {
                return ElevatedButton(
                  onPressed: ratingController.isLoading
                      ? null
                      : () async {
                          ratingController.shoe_id_controller.text =
                              widget.item.shoe_id.toString();
                          await ratingController.addRating();
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cBlack.withOpacity(0.5),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  child: const Text(
                    'Submit Review',
                    style: fWhiteSemiBold14,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
