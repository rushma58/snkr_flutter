import 'package:flutter/material.dart';
import 'package:snkr_flutter/core/utils/fonts.dart';

class ShoeDetalCard extends StatefulWidget {
  final String source;
  final BoxFit? resizeMode;
  final String label;
  final VoidCallback onTap;

  const ShoeDetalCard({
    Key? key,
    required this.source,
    this.resizeMode,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  _ShoeDetalCardState createState() => _ShoeDetalCardState();
}

class _ShoeDetalCardState extends State<ShoeDetalCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 10, 0),
        child: Column(
          children: [
            // CachedNetworkImage(
            //   imageUrl: widget.source,
            //   fit: widget.resizeMode ?? BoxFit.contain,
            //   width: 100,
            //   height: 150,
            //   placeholder: (context, url) => const SpinKitCircle(
            //     color: cWhite,
            //   ),
            //   errorWidget: (context, url, error) => const Icon(Icons.error),
            //   fadeInDuration: const Duration(milliseconds: 300),
            //   fadeOutDuration: const Duration(milliseconds: 100),
            // ),
            Image.network(
              widget.source.toString(),
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              margin: const EdgeInsets.fromLTRB(0, 6, 0, 0),
              padding: const EdgeInsets.symmetric(horizontal: 2),
              width: 100,
              child: Text(
                widget.label,
                style: fGBrownSemiBold12,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
