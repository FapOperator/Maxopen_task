import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:maxopen_task/core/di/get_it.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/genres_cubit/genres_cubit.dart';
import 'package:maxopen_task/core/theme/app_color.dart';
import 'package:maxopen_task/l10n/all_locales.dart';
import 'package:maxopen_task/route/fade_page_route_builder.dart';
import 'package:maxopen_task/route/route_constants.dart';
import 'package:maxopen_task/route/routes.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/bottom_bar/bottom_bar_bloc.dart';

class CoolMovies extends StatelessWidget {
  const CoolMovies({super.key});
  @override
  Widget build(BuildContext context) {
    String locale = Platform.localeName;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomBarBloc(),
        ),
        BlocProvider(
          create: (context) => getIt<GenresCubit>()..getGenres(locale),
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
        supportedLocales: AllLocale.all,
        locale: Locale(Platform.localeName.substring(0, 2)),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],

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
