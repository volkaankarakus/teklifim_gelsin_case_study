enum HowOldAreUEnum {
  youngerAndEqual18,
  between19and25,
  between26and35,
  olderAndEqual36,
}

extension HowOldAreUExtension on HowOldAreUEnum {
  String get asString {
    switch (this) {
      case HowOldAreUEnum.youngerAndEqual18:
        return '18 ve altı';
      case HowOldAreUEnum.between19and25:
        return '19 - 25';
      case HowOldAreUEnum.between26and35:
        return '26 - 35';
      case HowOldAreUEnum.olderAndEqual36:
        return '36 ve üzeri';
    }
  }

  int get asIDInt {
    switch (this) {
      case HowOldAreUEnum.youngerAndEqual18:
        return 1;
      case HowOldAreUEnum.between19and25:
        return 2;
      case HowOldAreUEnum.between26and35:
        return 3;
      case HowOldAreUEnum.olderAndEqual36:
        return 4;
    }
  }
}
