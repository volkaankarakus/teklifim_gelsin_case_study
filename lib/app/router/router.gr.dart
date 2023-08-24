// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class $AppRouter extends RootStackRouter {
  $AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    HomeDetailViewRoute.name: (routeData) {
      final args = routeData.argsAs<HomeDetailViewRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomeDetailView(
          key: args.key,
          howOldAreYouCardList: args.howOldAreYouCardList,
          spendingHabitsCardList: args.spendingHabitsCardList,
          creditCardExpectationsCardList: args.creditCardExpectationsCardList,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        RouteConfig(
          HomeDetailViewRoute.name,
          path: '/home-detail-view',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeViewRoute extends PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeViewRoute';
}

/// generated route for
/// [HomeDetailView]
class HomeDetailViewRoute extends PageRouteInfo<HomeDetailViewRouteArgs> {
  HomeDetailViewRoute({
    Key? key,
    required List<CardModel<CardModelType>>? howOldAreYouCardList,
    required List<CardModel<CardModelType>> spendingHabitsCardList,
    required List<CardModel<CardModelType>> creditCardExpectationsCardList,
  }) : super(
          HomeDetailViewRoute.name,
          path: '/home-detail-view',
          args: HomeDetailViewRouteArgs(
            key: key,
            howOldAreYouCardList: howOldAreYouCardList,
            spendingHabitsCardList: spendingHabitsCardList,
            creditCardExpectationsCardList: creditCardExpectationsCardList,
          ),
        );

  static const String name = 'HomeDetailViewRoute';
}

class HomeDetailViewRouteArgs {
  const HomeDetailViewRouteArgs({
    this.key,
    required this.howOldAreYouCardList,
    required this.spendingHabitsCardList,
    required this.creditCardExpectationsCardList,
  });

  final Key? key;

  final List<CardModel<CardModelType>>? howOldAreYouCardList;

  final List<CardModel<CardModelType>> spendingHabitsCardList;

  final List<CardModel<CardModelType>> creditCardExpectationsCardList;

  @override
  String toString() {
    return 'HomeDetailViewRouteArgs{key: $key, howOldAreYouCardList: $howOldAreYouCardList, spendingHabitsCardList: $spendingHabitsCardList, creditCardExpectationsCardList: $creditCardExpectationsCardList}';
  }
}
