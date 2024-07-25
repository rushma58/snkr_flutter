import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';
import 'package:snkr_flutter/core/widgets/top_nav_bar.dart';

class UnderDevelopmentPage extends StatelessWidget {
  const UnderDevelopmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopNavBar(
            appBarName: "Under Development",
            filterRequired: false,
            backFunction: ''),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: cWhite),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Iconify(
                    MaterialSymbols.construction,
                    size: 100,
                    color: cGrayOld,
                  ),
                  Text(
                    "Page Under Development",
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
