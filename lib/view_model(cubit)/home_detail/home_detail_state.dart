part of 'home_detail_cubit.dart';

final class HomeDetailState extends Equatable {
  HomeDetailState({
    this.howOldAreYouCardList,
    this.spendingHabitsCardList,
    this.creditCardExpectationsCardList,
    this.offersModel,
  });

  final List<CardModel>? howOldAreYouCardList;
  final List<CardModel<CardModelType>>? spendingHabitsCardList;
  final List<CardModel<CardModelType>>? creditCardExpectationsCardList;

  // Offers Model
  OffersModel? offersModel;

  HomeDetailState copyWith({
    List<CardModel>? howOldAreYouCardList,
    List<CardModel<CardModelType>>? spendingHabitsCardList,
    List<CardModel<CardModelType>>? creditCardExpectationsCardList,
    OffersModel? offersModel,
  }) {
    return HomeDetailState(
      howOldAreYouCardList: howOldAreYouCardList ?? this.howOldAreYouCardList,
      spendingHabitsCardList:
          spendingHabitsCardList ?? this.spendingHabitsCardList,
      creditCardExpectationsCardList:
          creditCardExpectationsCardList ?? this.creditCardExpectationsCardList,
      offersModel: offersModel ?? this.offersModel,
    );
  }

  @override
  List<Object?> get props => [
        howOldAreYouCardList,
        spendingHabitsCardList,
        creditCardExpectationsCardList,
        offersModel,
      ];
}
