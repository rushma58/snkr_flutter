import 'package:flutter/material.dart';

class ContainerButtonModel extends StatelessWidget {
  final String itext;
  final Color bgColor;
  final double containerWidth;
  final VoidCallback? onPressed; // Make onPressed optional

  const ContainerButtonModel({
    Key? key,
    required this.itext,
    required this.bgColor,
    required this.containerWidth,
    this.onPressed, // Optional onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Use GestureDetector to handle taps
      child: Container(
        height: 60,
        width: containerWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
        ),
        child: Center(
          child: Text(
            itext,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
