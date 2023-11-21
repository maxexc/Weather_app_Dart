import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key,
    required this.child,
    required this.assetBackGroundImage,
  });

  final Widget child;
  final String assetBackGroundImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(assetBackGroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
