import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class NoItemCart extends StatelessWidget {
  const NoItemCart({super.key});

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
                  Iconify(
                    MaterialSymbols.shopping_cart_outline,
                    size: 100,
                    color: cGrayOld,
                  ),
                  Text(
                    "Your cart is empty",
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
