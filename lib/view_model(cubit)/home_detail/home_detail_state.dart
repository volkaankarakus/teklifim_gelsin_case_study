part of 'home_detail_cubit.dart';

@immutable
final class HomeDetailState extends Equatable {
  HomeDetailState({
    this.howOldAreYouCardList,
    this.spendingHabitsCardList,
    this.creditCardExpectationsCardList,
    this.offersModel,
    this.sponsorAndActiveOffers,
  });

  final List<CardModel>? howOldAreYouCardList;
  final List<CardModel<CardModelType>>? spendingHabitsCardList;
  final List<CardModel<CardModelType>>? creditCardExpectationsCardList;

  // Offers Model
  final OffersModel? offersModel;

  // Sponsored & Active Offers
  List<OfferModel>? sponsorAndActiveOffers;

  HomeDetailState copyWith({
    List<CardModel>? howOldAreYouCardList,
    List<CardModel<CardModelType>>? spendingHabitsCardList,
    List<CardModel<CardModelType>>? creditCardExpectationsCardList,
    OffersModel? offersModel,
    List<OfferModel>? sponsorAndActiveOffers,
  }) {
    return HomeDetailState(
      howOldAreYouCardList: howOldAreYouCardList ?? this.howOldAreYouCardList,
      spendingHabitsCardList:
          spendingHabitsCardList ?? this.spendingHabitsCardList,
      creditCardExpectationsCardList:
          creditCardExpectationsCardList ?? this.creditCardExpectationsCardList,
      offersModel: offersModel ?? this.offersModel,
      sponsorAndActiveOffers:
          sponsorAndActiveOffers ?? this.sponsorAndActiveOffers,
    );
  }

  @override
  List<Object?> get props => [
        howOldAreYouCardList,
        spendingHabitsCardList,
        creditCardExpectationsCardList,
        offersModel,
        sponsorAndActiveOffers,
      ];
}
