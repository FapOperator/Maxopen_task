import 'package:flutter/material.dart';
import 'package:maxopen_task/route/route_constants.dart';
import 'package:maxopen_task/screen/home/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(
    RouteSettings setting,
  ) =>
      {
        RouteList.initial: (context) => const HomeScreen(),
        // RouteList.loginScreen: (context) => const LoginPage(),
        // RouteList.homeScreen: (context) => const HomeScreen(),
        // RouteList.summaryScreen: (context) => const SummaryScreen(),
        // RouteList.requestListScreen: (context) =>
        //     RequestListScreen(isForcedRequest: setting.arguments as bool?),
        // RouteList.requestDetailScreen: (context) {
        //   if (setting.arguments != null) {
        //     final args = setting.arguments as Map<String, dynamic>;
        //     return RequestDetailScreen(
        //       requestModel: args['singleRequest'],
        //       statusRequestListModel: args['statusList'],
        //     );
        //   }
        //   return const ErrorScreen();
        // }
      };
}