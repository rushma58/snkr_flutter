import 'package:flutter/material.dart';

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
            size: 40,
            color: Colors.black,
          ),
          Image.asset(
            "assets/icons/main_logo.png",
            height: 50,
            fit: BoxFit.fitHeight,
          ),
          const InkWell(
            //           onTap: (){
            //             Navigator.pushNamed(context, "cartPage");
            //           },
            child: Icon(
              Icons.toggle_off,
              size: 50,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
