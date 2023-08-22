part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({
    this.offersModel,
    this.selectedHowOldAreUCardModel,
    this.howOldAreYouCardList,
  }) {
    howOldAreYouCardList = howOldAreUCardList;
  }

  OffersModel? offersModel;

  CardModel<CardModelType>? selectedHowOldAreUCardModel;
  List<CardModel>? howOldAreYouCardList;

  HomeState copyWith(
      {OffersModel? offersModel,
      CardModel<CardModelType>? selectedHowOldAreUCardModel,
      List<CardModel>? howOldAreYouCardList}) {
    return HomeState(
      offersModel: offersModel ?? this.offersModel,
      selectedHowOldAreUCardModel:
          selectedHowOldAreUCardModel ?? this.selectedHowOldAreUCardModel,
      howOldAreYouCardList: howOldAreYouCardList ?? this.howOldAreYouCardList,
    );
  }

  @override
  List<Object?> get props => [
        offersModel,
        selectedHowOldAreUCardModel,
      ];
}

List<CardModel>? howOldAreUCardList = <CardModel<CardModelTypeHowOldAreU>>[
  CardModel(
    index: 0,
    type: CardModelTypeHowOldAreUUnder18(),
  ),
  CardModel(
    index: 1,
    type: CardModelTypeHowOldAreUBetween19and25(),
  ),
  CardModel(
    index: 2,
    type: CardModelTypeHowOldAreUBetween26and35(),
  ),
  CardModel(
    index: 3,
    type: CardModelTypeHowOldAreUOlderAndEqual36(),
  ),
];
