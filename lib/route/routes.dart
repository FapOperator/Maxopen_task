import 'package:flutter/material.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/movie_detail/movie_details_screen.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/main_view/main_view.dart';
import 'package:maxopen_task/route/route_constants.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(
    RouteSettings setting,
  ) =>
      {
        RouteList.initial: (context) => const MainView(),
        // RouteList.homeScreen: (context) => const HomeScreen(),
        // RouteList.summaryScreen: (context) => const SummaryScreen(),
        // RouteList.requestListScreen: (context) =>
        //     RequestListScreen(isForcedRequest: setting.arguments as bool?),
        RouteList.movieDetails: (context) {
          if (setting.arguments != null) {
            final args = setting.arguments as Map<String, dynamic>;
            return MovieDetailsScreen(
              movie: args['movie'],
            );
          }
          return const MainView();
        }
      };
}
