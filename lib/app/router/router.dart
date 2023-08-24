import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teklifim_gelsin_case_study/app/router/custom_route_builder.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/view/home_detail/home_detail_view.dart';
import 'package:teklifim_gelsin_case_study/view/home/home_view.dart';

part 'router.gr.dart';

@CustomAutoRouter(
    durationInMilliseconds: 400,
    transitionsBuilder: CustomRouteBuilderr.slideTransitionBuilder,
    routes: [
      MaterialRoute(
        initial: true,
        page: HomeView,
        name: 'homeViewRoute',
      ),
      MaterialRoute(
        page: HomeDetailView,
        name: 'homeDetailViewRoute',
      )
    ])
class AppRouter {
  HomeView? onboardView;
}
