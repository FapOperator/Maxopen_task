import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/core/di/get_it.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/genres_cubit/genres_cubit.dart';
import 'package:maxopen_task/features/home_screen/presentation/theme/app_color.dart';
import 'package:maxopen_task/route/fade_page_route_builder.dart';
import 'package:maxopen_task/route/route_constants.dart';
import 'package:maxopen_task/route/routes.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/bottom_bar/bottom_bar_bloc.dart';

class CoolMovies extends StatelessWidget {
  const CoolMovies({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomBarBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<GenresCubit>()..getGenres(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cool Movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: AppColor.white),
          ),
        ),

        // инициализация навигации
        initialRoute: RouteList.initial,
        onGenerateRoute: (RouteSettings settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder<dynamic>(
            builder: builder!,
            settings: settings,
          );
        },
      ),
    );
  }
}
