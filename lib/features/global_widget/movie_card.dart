import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:maxopen_task/core/common/api_constant.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/presentation/theme/app_color.dart';
import 'package:maxopen_task/features/home_screen/presentation/widgets/movie_rating_genres.dart';
import 'package:maxopen_task/route/route_constants.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteList.movieDetails,
          arguments: {
            'movie': movie,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: movie.posterPath != null
                      ? (ApiConstants.imageUrl + movie.posterPath!)
                      : '',
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                  fit: BoxFit.contain,
                  width: 1000,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    color: AppColor.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                MovieRatingGenres(movie: movie),
                SizedBox(
                  height: 10,
                ),
                Text(
                  movie.overview,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xFF888888),
                    fontSize: 13,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
