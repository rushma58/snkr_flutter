import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
  const ItemAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 90),
            child: Text(
              "Product Detail",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.favorite_border_outlined,
            color: Colors.red,
            size: 30,
          )
        ],
      ),
    );
  }
}
