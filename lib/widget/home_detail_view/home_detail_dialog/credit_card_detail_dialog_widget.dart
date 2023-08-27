import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/model/offer_model.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/offer_model_extension.dart';
import 'package:teklifim_gelsin_case_study/widget/cached_network_image_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_detail_view/apply_now_container_widget.dart';

class CreditCardDetailDialogWidget extends StatelessWidget {
  final OfferModel offerModel;

  CreditCardDetailDialogWidget({
    super.key,
    required this.offerModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.33,
      width: MediaQuery.sizeOf(context).width * 0.9,
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
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImageWidget(
                      imageUrl: offerModel.img_url ?? '',
                      width: MediaQuery.sizeOf(context).width * 0.3,
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
                    size: MediaQuery.sizeOf(context).height * 0.004),
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
                    size: MediaQuery.sizeOf(context).height * 0.004),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Yıllık'),
                        Text('Ödeme'),
                        Text(
                          '₺${offerModel.annual_payment?.toInt().toString()}',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('Alışveriş'),
                        Text('Faizi'),
                        Text(
                          '%${offerModel.shopping_interest?.toString()}',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('Gecikme'),
                        Text('Faizi'),
                        Text(
                          '%${offerModel.overdue_interest?.toString()}',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text('Nakit Avans'),
                        Text('Faizi'),
                        Text(
                          '%${offerModel.cash_advance_interest?.toString()}',
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                  ],
                ),
                DynamicSizedBox(
                    size: MediaQuery.sizeOf(context).height * 0.002),
                ApplyNowContainerWidget(
                  onTap: () {},
                  text: offerModel.isSponsorOffer ? 'Hemen Başvur!' : 'Başvur',
                ),
                DynamicSizedBox(
                    size: MediaQuery.sizeOf(context).height * 0.015),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
