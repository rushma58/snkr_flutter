import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class TopNavBar extends StatelessWidget {
  final String backFunction;
  final String appBarName;
  final bool filterRequired;
  final VoidCallback? onPressedFilter; // Make it nullable
  final PreferredSizeWidget? bottom; // Make it nullable

  const TopNavBar({
    super.key, // Add Key? key parameter
    required this.appBarName,
    required this.filterRequired,
    required this.backFunction,
    this.onPressedFilter, // Make it nullable
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      leading: IconButton(
        onPressed: () {
          //Navigator.pop(context);
          if (backFunction == '') {
            Navigator.pop(context);
          }
          // else {
          //   if (backFunction == "orderManagement") {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (builder) => const LayoutScreen(initalIndex: 1),
          //       ),
          //     );
          //   } else if (backFunction == "distributorManagement") {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (builder) => const LayoutScreen(initalIndex: 2),
          //       ),
          //     );
          //   } else if (backFunction == "industryReport") {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (builder) => const LayoutScreen(initalIndex: 3),
          //       ),
          //     );
          //   } else if (backFunction == "paymentPlan") {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (builder) => const LayoutScreen(initalIndex: 4),
          //       ),
          //     );
          //   } else {
          //     NavigationUtils.navigateToGivenScreen(context, backFunction);
          //   }
          // }

          // backFunction != ''
          //     ? NavigationUtils.navigateToGivenScreen(context, backFunction)
          //     : Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: cWhite,
        ),
      ),
      elevation: 10,
      title: Center(
        child: Text(appBarName, style: fWhiteSemiBold16),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: filterRequired &&
                  onPressedFilter !=
                      null // Check if onPressedFilter is not null
              ? IconButton(
                  onPressed: onPressedFilter,
                  icon: const Icon(
                    Icons.filter_list,
                    color: cWhite,
                  ),
                )
              : const SizedBox(width: 15),
        )
      ],
      backgroundColor: cBlack,
    );
  }
}
