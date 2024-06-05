import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
          Image.asset(
            "assets/icons/main_logo.png",
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          InkWell(
            //           onTap: (){
            //             Navigator.pushNamed(context, "cartPage");
            //           },
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              decoration: const BoxDecoration(
                  color: cBlack,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: const Text(
                "Sell",
                style: fWhiteSemiBold16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
