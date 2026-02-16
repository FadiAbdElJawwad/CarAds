import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'skeleton.dart';
import '../core/extension/app_sizes.dart';

class NetworkCustomImageWidget extends StatelessWidget {
  const NetworkCustomImageWidget({
    required this.imageUrl,
    required this.height,
    this.background = false,
    this.isSvg = false,
    this.fit = BoxFit.fill,
    this.width,
    super.key,
  });
  final String imageUrl;
  final double height;
  final bool background;
  final bool isSvg;
  final BoxFit fit;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height(height),
      width: width,
      child: isSvg
          ? SvgPicture.network(
        imageUrl,
        placeholderBuilder: (BuildContext context) => Skeleton(
          height: context.height(height),
          width: width ?? double.infinity,
        ),
        height: context.height(height),
        fit: fit,
      ).center()
          : CachedNetworkImage(
        alignment: Alignment.center,
        imageUrl: imageUrl,
        fit: fit,
        width: double.infinity,
        placeholder: (context, url) => Skeleton(
          height: context.height(height),
          width: width ?? double.infinity,
        ),
        errorWidget: (context, url, error) =>
        const Icon(Icons.error, size: 50),
      ).center(),
    );
  }
}
