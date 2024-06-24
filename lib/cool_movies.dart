import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/application/loading/loading_cubit.dart';
import 'package:maxopen_task/di/get_it.dart';
import 'package:maxopen_task/route/fade_page_route_builder.dart';
import 'package:maxopen_task/route/route_constants.dart';
import 'package:maxopen_task/route/routes.dart';
import 'package:maxopen_task/screen/error/error_screen.dart';
import 'package:maxopen_task/screen/loading/loading_screen.dart';

class CoolMovies extends StatelessWidget {
  const CoolMovies({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoadingCubit>.value(
          value: getIt<LoadingCubit>(),
        ),
        // ),
        // BlocProvider<AddRequestCubit>(
        //   create: (context) => getIt<AddRequestCubit>(),
        // ),
        // BlocProvider(create: (context) => getIt<PickerPhotoBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cool Movies',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        builder: (context, child) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            return ErrorScreen(errorDetails: errorDetails);
          };

          return LoadingScreen(
            screen: child!,
          );
        },

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
