import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/utils/colors.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class CustomIconButton extends StatefulWidget {
  final Icon icon;
  final String icon_name;
  final void Function() onTap;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.icon_name,
    required this.onTap,
  });

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: cGray,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      //margin: const EdgeInsets.all(1),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.onTap,
            icon: widget.icon,
            iconSize: 35,
            color: cBlack,
          ),
          Text(
            widget.icon_name,
            style: fBlackRegular12,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
