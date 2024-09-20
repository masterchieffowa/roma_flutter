import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double width;
  final double height;
  final bool isAsset;

  const SvgIcon({
    required this.assetName,
    required this.width,
    required this.height,
    this.isAsset = true,
  });

  @override
  Widget build(BuildContext context) {
    return isAsset
        ? SvgPicture.asset(
      assetName,
      width: width,
      height: height,
    )
        : SvgPicture.string(
      assetName,
      width: width,
      height: height,
      allowDrawingOutsideViewBox: true,
      fit: BoxFit.fill,
    );
  }
}
