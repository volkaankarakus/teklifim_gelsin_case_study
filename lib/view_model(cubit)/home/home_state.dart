part of 'home_cubit.dart';

@immutable
final class HomeState extends Equatable {
  HomeState({
    this.offersModel,
    this.selectedHowOldAreUCardModel,
    this.selectedSpendingHabitsList,
    this.selectedCreditCardExpectations,
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
    counter = ccounter;
  }

  OffersModel? offersModel;

  // Counter for the page changing
  int? counter;

  // How old are u
  List<CardModel>? howOldAreYouCardList;
  CardModel<CardModelType>? selectedHowOldAreUCardModel;

  // Spending Habits
  List<CardModel>? spendingHabitsCardList;
  List<CardModel>? selectedSpendingHabitsList;

  // Credit Card Expectations
  List<CardModel>? creditCardExpectationsCardList;
  List<CardModel>? selectedCreditCardExpectations;

  // Page Controller
  PageController? controller = PageController();

  HomeState copyWith({
    OffersModel? offersModel,
    CardModel<CardModelType>? selectedHowOldAreUCardModel,
    List<CardModel>? spendingHabitsCardList,
    List<CardModel>? howOldAreYouCardList,
    List<CardModel>? creditCardExpectationsCardList,
    PageController? controller,
    int? counter,
    List<CardModel>? selectedSpendingHabitsList,
    List<CardModel>? selectedCreditCardExpectations,
  }) {
    return HomeState(
        offersModel: offersModel ?? this.offersModel,
        selectedHowOldAreUCardModel:
            selectedHowOldAreUCardModel ?? this.selectedHowOldAreUCardModel,
        selectedCreditCardExpectations: selectedCreditCardExpectations ??
            this.selectedCreditCardExpectations,
        howOldAreYouCardList: howOldAreYouCardList ?? this.howOldAreYouCardList,
        controller: controller ?? this.controller,
        counter: counter ?? this.counter,
        spendingHabitsCardList:
            spendingHabitsCardList ?? this.spendingHabitsCardList,
        creditCardExpectationsCardList: creditCardExpectationsCardList ??
            this.creditCardExpectationsCardList,
        selectedSpendingHabitsList:
            selectedSpendingHabitsList ?? this.selectedSpendingHabitsList);
  }

  @override
  List<Object?> get props => [
        offersModel,
        selectedHowOldAreUCardModel,
        spendingHabitsCardList,
        howOldAreYouCardList,
        controller,
        counter,
        selectedSpendingHabitsList,
        selectedCreditCardExpectations
      ];
}

PageController ccontroller = PageController();
int ccounter = 1;
