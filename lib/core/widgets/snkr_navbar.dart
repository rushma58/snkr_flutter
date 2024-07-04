import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class SnkrNavbar extends StatelessWidget {
  final String appBarName;

  const SnkrNavbar({
    super.key, // Add Key? key parameter
    required this.appBarName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: cBlack,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            appBarName,
            style: fWhiteSemiBold24,
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Image.asset(
              "assets/icons/main_logo.png",
              height: 30,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
