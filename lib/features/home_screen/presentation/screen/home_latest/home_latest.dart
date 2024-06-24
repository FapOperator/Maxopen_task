import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/common/api_constant.dart';
import 'package:maxopen_task/di/get_it.dart';
import 'package:maxopen_task/features/genres/common/genres_function.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/latest_cubit/latest_cubit.dart';
import 'package:maxopen_task/presentation/theme/app_color.dart';

class HomeLatest extends StatelessWidget {
  const HomeLatest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LatestCubit>()..getTopFiveMovie(),
      child: BlocBuilder<LatestCubit, LatestState>(
        builder: (context, state) {
          if (state is LatestLoaded) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.movieModel.length,
                itemBuilder: (context, index) {
                  Movie singleMovie = state.movieModel[index];
                  List<String> genresString = GenresFunction()
                      .computeGenres(singleMovie.genreIds, state.genresModel);
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: ApiConstants.imageUrl +
                                  singleMovie.posterPath!,
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                  value: downloadProgress.progress,
                                ),
                              ),
                              fit: BoxFit.contain,
                              width: 1000,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              singleMovie.title,
                              style: TextStyle(
                                color: AppColor.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              singleMovie.voteAverage.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              genresString.join(', '),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              singleMovie.overview,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
