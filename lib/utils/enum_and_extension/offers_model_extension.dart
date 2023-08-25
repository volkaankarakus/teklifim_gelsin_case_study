import 'package:teklifim_gelsin_case_study/model/offers_model.dart';

extension OffersModelExtension on OffersModel? {
  int get countTotalOffers {
    int sponsoredOffersCount = this?.sponsored_offers?.length ?? 0;
    int activeOffersCount = this?.active_offers?.length ?? 0;
    int passiveOffersCount = this?.passive_offers?.length ?? 0;
    return sponsoredOffersCount + activeOffersCount + passiveOffersCount;
  }
}
