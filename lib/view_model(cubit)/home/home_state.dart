part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({
    this.offersModel,
    this.selectedHowOldAreUCardModel,
    this.howOldAreYouCardList,
    this.controller,
    this.counter,
    this.spendingHabitsCardList,
    this.creditCardExpectationsCardList,
  }) {
    howOldAreYouCardList = StaticModel.howOldAreUCardList;
    spendingHabitsCardList = StaticModel.spendingHabitsCardList;
    creditCardExpectationsCardList = StaticModel.creditCardExpectationsCardList;
    controller = ccontroller;
    counter = counter;
  }

  OffersModel? offersModel;
  int? counter;

  CardModel<CardModelType>? selectedHowOldAreUCardModel;
  List<CardModel>? howOldAreYouCardList;
  List<CardModel>? spendingHabitsCardList;
  List<CardModel>? creditCardExpectationsCardList;

  PageController? controller = PageController();

  HomeState copyWith({
    OffersModel? offersModel,
    CardModel<CardModelType>? selectedHowOldAreUCardModel,
    List<CardModel>? spendingHabitsCardList,
    List<CardModel>? howOldAreYouCardList,
    List<CardModel>? creditCardExpectationsCardList,
    PageController? controller,
    int? counter,
  }) {
    return HomeState(
      offersModel: offersModel ?? this.offersModel,
      selectedHowOldAreUCardModel:
          selectedHowOldAreUCardModel ?? this.selectedHowOldAreUCardModel,
      howOldAreYouCardList: howOldAreYouCardList ?? this.howOldAreYouCardList,
      controller: controller ?? this.controller,
      counter: counter ?? this.counter,
      spendingHabitsCardList:
          spendingHabitsCardList ?? this.spendingHabitsCardList,
      creditCardExpectationsCardList:
          creditCardExpectationsCardList ?? this.creditCardExpectationsCardList,
    );
  }

  @override
  List<Object?> get props => [
        offersModel,
        selectedHowOldAreUCardModel,
        spendingHabitsCardList,
        howOldAreYouCardList,
        controller,
        counter,
      ];
}

PageController ccontroller = PageController();
int counter = 1;
