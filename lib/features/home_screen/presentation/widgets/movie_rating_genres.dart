import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maxopen_task/features/genres/common/genres_function.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/genres_cubit/genres_cubit.dart';

class MovieRatingGenres extends StatelessWidget {
  final Movie movie;
  const MovieRatingGenres({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenresCubit, GenresState>(
      builder: (context, state) {
        if (state is GenresLoaded) {
          List<String> genresString =
              computeGenres(movie.genreIds, state.genresModel);
          String voteAverage = (movie.voteAverage / 2).toStringAsFixed(1);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    voteAverage,
                    style: const TextStyle(
                        height: 1,
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  RatingBar(
                    itemSize: 17,
                    ignoreGestures: true,
                    initialRating: movie.voteAverage / 2,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Image.asset('assets/images/icons/star.png'),
                      half: Image.asset('assets/images/icons/star_half.png'),
                      empty: Image.asset('assets/images/icons/star_empty.png'),
                    ),
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (_) {},
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                genresString.join(', '),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
