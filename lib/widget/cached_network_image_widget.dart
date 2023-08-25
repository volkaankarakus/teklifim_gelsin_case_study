import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/constant/duration_constant.dart';
import 'package:teklifim_gelsin_case_study/service/custom_image_cache_manager/custom_image_cache_manager.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  const CachedNetworkImageWidget(
      {super.key, required this.imageUrl, required this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      cacheManager: CustomImageCacheManager.customCacheManager,
      placeholderFadeInDuration:
          DurationConstant.kCachedImagePlaceholderFadeInDuration(),
      imageUrl: imageUrl,
      filterQuality: FilterQuality.low,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.fitWidth,
        )),
      ),
      errorWidget: (context, url, error) => const CircularProgressIndicator(),
    );
  }
}
