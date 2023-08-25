import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/model/offer_model.dart';

extension OfferModelExtension on OfferModel {
  bool get isSponsorOffer {
    return (sponsored != 0) ? true : false;
  }

  String get asStringSponsorOrActive {
    return isSponsorOffer ? 'Sponsorlu' : 'Uyumluluk %${rating?.toInt()}';
  }

  Color get asColorSponsorOrActive {
    return isSponsorOffer
        ? const ColorConstant.kSponsoredDividerColor()
        : const ColorConstant.kActiveOfferTextColor();
  }
}
