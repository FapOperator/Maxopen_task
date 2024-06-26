import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/core/common/conver_locale_string.dart';
import 'package:maxopen_task/core/di/get_it.dart';
import 'package:maxopen_task/features/global_widget/movie_card.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/latest_cubit/latest_cubit.dart';

class HomeLatest extends StatelessWidget {
  const HomeLatest({super.key});

  @override
  Widget build(BuildContext context) {
    String locale = convertLocaleString(context);
    return BlocProvider(
      create: (context) => getIt<LatestCubit>()..getTopFiveMovie(locale),
      child: BlocBuilder<LatestCubit, LatestState>(
        builder: (context, state) {
          if (state is LatestLoaded) {
            return Expanded(
              child: ListView.builder(
                itemCount:
                    state.movieModel.length < 6 ? state.movieModel.length : 6,
                itemBuilder: (context, index) {
                  Movie singleMovie = state.movieModel[index];
                  return MovieCard(movie: singleMovie);
                },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
