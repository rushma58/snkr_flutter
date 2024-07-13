import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class NoDataPage extends StatelessWidget {
  const NoDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Iconify(Mdi.delete_empty_outline, size: 100, color: cGrayOld),
                  Text(
                    "No Data",
                    style: fBlackSemiBold20,
                  ),
                  // Text(
                  //   "The data is ",
                  //   style: fGBrownSemiBold16,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
