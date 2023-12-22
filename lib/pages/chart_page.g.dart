// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_page.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $chartRoute,
    ];

RouteBase get $chartRoute => GoRouteData.$route(
      path: '/chart',
      factory: $ChartRouteExtension._fromState,
    );

extension $ChartRouteExtension on ChartRoute {
  static ChartRoute _fromState(GoRouterState state) => const ChartRoute();

  String get location => GoRouteData.$location(
        '/chart',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
