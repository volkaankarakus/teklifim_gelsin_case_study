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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeDetailView(),
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
class HomeDetailViewRoute extends PageRouteInfo<void> {
  const HomeDetailViewRoute()
      : super(
          HomeDetailViewRoute.name,
          path: '/home-detail-view',
        );

  static const String name = 'HomeDetailViewRoute';
}
