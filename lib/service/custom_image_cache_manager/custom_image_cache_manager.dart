import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:teklifim_gelsin_case_study/constant/duration_constant.dart';

class CustomImageCacheManager {
  static final customCacheManager = CacheManager(
    Config(
      'customImageKey',
      stalePeriod: DurationConstant.kCacheImageStalePeriodDuration(),
      maxNrOfCacheObjects: 100,
    ),
  );
}
