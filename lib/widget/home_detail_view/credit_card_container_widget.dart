import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/model/offer_model.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/offer_model_extension.dart';
import 'package:teklifim_gelsin_case_study/widget/cached_network_image_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_detail_view/apply_now_container_widget.dart';

class CreditCardContainerWidget extends StatelessWidget {
  final OfferModel offerModel;
  void Function()? onTap;
  CreditCardContainerWidget({
    super.key,
    required this.offerModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.25,
        decoration: BoxDecoration(
            color: const ColorConstant.kBoxContainerBackgroundColor(),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2,
              color: const ColorConstant.kBoxContainerBorderColor(),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.01),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImageWidget(
                        imageUrl: offerModel.img_url ?? '',
                        width: 120,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    offerModel.asStringSponsorOrActive,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: offerModel.asColorSponsorOrActive,
                        ),
                  ),
                  DynamicSizedBox(
                      size: MediaQuery.sizeOf(context).height * 0.01),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      children: [
                        const Divider(
                          thickness: 15,
                          color: ColorConstant.kBoxContainerColorPassive(),
                        ),
                        FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: offerModel.isSponsorOffer
                              ? 1
                              : offerModel.rating! / 100,
                          child: Divider(
                            thickness: 15,
                            color: offerModel.isSponsorOffer
                                ? const ColorConstant.kSponsoredDividerColor()
                                : const ColorConstant.kActiveOfferTextColor(),
                          ),
                        )
                      ],
                    ),
                  ),
                  DynamicSizedBox(
                      size: MediaQuery.sizeOf(context).height * 0.01),
                  ApplyNowContainerWidget(
                    onTap: () {},
                    text:
                        offerModel.isSponsorOffer ? 'Hemen Başvur!' : 'Başvur',
                  ),
                  DynamicSizedBox(
                    size: MediaQuery.sizeOf(context).height * 0.01,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
