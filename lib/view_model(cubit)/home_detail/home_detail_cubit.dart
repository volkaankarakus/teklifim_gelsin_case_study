import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/offers_model.dart';
import 'package:teklifim_gelsin_case_study/request/post/create_card_post_request.dart';

part 'home_detail_state.dart';

class HomeDetailCubit extends Cubit<HomeDetailState> {
  HomeDetailCubit() : super(HomeDetailState()) {
    Future.microtask(() => fetchData());
  }

  // ** Set Values from HomeView
  void setHowOldAreUs(List<CardModel>? cardList) {
    emit(state.copyWith(howOldAreYouCardList: cardList));
  }

  void setSpendingHabits(List<CardModel<CardModelType>>? cardList) {
    emit(state.copyWith(spendingHabitsCardList: cardList));
  }

  void setCardExpectations(List<CardModel<CardModelType>>? cardList) {
    emit(state.copyWith(creditCardExpectationsCardList: cardList));
  }

  // ** Post Request
  CreateCardPostRequest createCardPostRequest = CreateCardPostRequest();

  // ** Get Data
  Future<void> fetchData() async {
    OffersModel? response = await createCardPostRequest.fetchOffers();
    emit(state.copyWith(offersModel: response));
  }

  void a() {
    for (var creditCardExpectation in (state.creditCardExpectationsCardList!)) {
      print('credit card expectation : ${creditCardExpectation.type.text}');
      print(
          'credit card expectation isSelected : ${creditCardExpectation.isSelected}');
    }
  }
}
