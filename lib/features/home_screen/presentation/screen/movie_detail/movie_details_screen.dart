import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maxopen_task/core/common/api_constant.dart';
import 'package:maxopen_task/core/di/get_it.dart';
import 'package:maxopen_task/features/genres/common/genres_function.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/genres_cubit/genres_cubit.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/movie_detail/favourite/favourite_cubit.dart';
import 'package:maxopen_task/features/home_screen/presentation/theme/app_color.dart';
import 'package:readmore/readmore.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;
  const MovieDetailsScreen({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FavouriteCubit>()..checkIfFavoriteMovie(widget.movie.id),
      child: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          bool isFavourite = false;
          if (state is IsFavoriteMovie) {
            isFavourite = state.isMovieFavorite;
          } else {
            isFavourite = false;
          }
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: const BackButton(
                color: AppColor.white,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<FavouriteCubit>()
                        .toogleFavourite(widget.movie, isFavourite);
                  },
                  icon: Image.asset(
                    isFavourite
                        ? 'assets/images/icons/favourite.png'
                        : 'assets/images/icons/favourite_outline.png',
                    width: 17,
                    height: 24,
                  ),
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                ..._buildBackground(context, widget.movie),
                _buildMovieInformation(context, widget.movie),
              ],
            ),
          );
        },
      ),
    );
  }

  Positioned _buildMovieInformation(BuildContext context, Movie movie) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 2.3,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<GenresCubit, GenresState>(
              builder: (context, state) {
                if (state is GenresLoaded) {
                  List<String> genresString =
                      computeGenres(movie.genreIds, state.genresModel);
                  String voteAverage =
                      (movie.voteAverage / 2).toStringAsFixed(1);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            voteAverage,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          RatingBar(
                            itemSize: 20,
                            ignoreGestures: true,
                            initialRating: movie.voteAverage / 2,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            ratingWidget: RatingWidget(
                              full: Image.asset('assets/images/icons/star.png'),
                              half: Image.asset(
                                  'assets/images/icons/star_half.png'),
                              empty: Image.asset(
                                  'assets/images/icons/star_empty.png'),
                            ),
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
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
            ),
            const SizedBox(height: 10),
            ReadMoreText(
              movie.overview,
              trimMode: TrimMode.Line,
              trimLines: 5,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Read More',
              trimExpandedText: 'Show less',
              moreStyle: const TextStyle(
                color: AppColor.assent,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
              lessStyle: const TextStyle(
                color: AppColor.assent,
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
              style: const TextStyle(
                color: Color(0xFF888888),
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildBackground(context, Movie movie) {
    return [
      Container(
        height: double.infinity,
        color: AppColor.background,
      ),
      CachedNetworkImage(
        height: MediaQuery.of(context).size.height * 0.5,
        imageUrl: ApiConstants.imageUrl + movie.posterPath!,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
        fit: BoxFit.cover,
        width: 1000,
      ),
      const Positioned.fill(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppColor.background,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.5],
            ),
          ),
        ),
      ),
    ];
  }
}
