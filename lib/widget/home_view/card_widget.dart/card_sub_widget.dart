import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/container_button_widget.dart';

class CardSubWidget<T extends CardModelType> extends StatefulWidget {
  final String headlineText;
  final List<CardModel<CardModelType>> cardList;
  final CardModel<CardModelType>? selectedCard;
  const CardSubWidget({
    super.key,
    required this.headlineText,
    required this.cardList,
    this.selectedCard,
  });

  @override
  State<CardSubWidget<T>> createState() => _CardSubWidgetState<T>();
}

class _CardSubWidgetState<T extends CardModelType>
    extends State<CardSubWidget<T>> {
  // This step is required for cubit list definitions
  @override
  void didChangeDependencies() {
    BlocProvider.of<HomeCubit>(context).initLists();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.headlineText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        BlocSelector<HomeCubit, HomeState, int>(
          selector: (state) => state.counter ?? 1,
          builder: (context, state) {
            return DynamicSizedBox(
                size: state.isOdd
                    ? MediaQuery.sizeOf(context).height * 0.05
                    : MediaQuery.sizeOf(context).height * 0.02);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocSelector<HomeCubit, HomeState, int>(
            selector: (state) => state.counter ?? 1,
            builder: (context, state) {
              return SizedBox(
                height: state.isOdd
                    ? MediaQuery.sizeOf(context).height * 0.15
                    : MediaQuery.sizeOf(context).height * 0.2,
                child: BlocSelector<HomeCubit, HomeState,
                    List<CardModel<CardModelType>>>(
                  selector: (state) => widget.cardList,
                  builder: (context, state) {
                    return GridView.builder(
                      itemCount: state.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 3,
                      ),
                      itemBuilder: (context, index) {
                        CardModel<CardModelType> cardModel = state[index];
                        return BlocSelector<HomeCubit, HomeState,
                            CardModel<CardModelType>?>(
                          selector: (state) => widget.selectedCard,
                          builder: (context, state) {
                            return ContainerButtonWidget(
                              cardModel: cardModel as CardModel<T>,
                              onTap: () => context
                                  .read<HomeCubit>()
                                  .changeIsSelected(cardModel: cardModel),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
