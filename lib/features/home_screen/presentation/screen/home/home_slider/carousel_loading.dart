import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:maxopen_task/core/common/api_constant.dart';
import 'package:maxopen_task/core/common/conver_locale_string.dart';
import 'package:maxopen_task/core/di/get_it.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/top_five/top_five_cubit.dart';
import 'package:maxopen_task/route/route_constants.dart';

class CarouselSliderDataFound extends StatelessWidget {
  const CarouselSliderDataFound({super.key});

  @override
  Widget build(BuildContext context) {
    String locale = convertLocaleString(context);
    return BlocProvider(
      create: (context) => getIt<TopFiveCubit>()..getTopFiveMovie(locale),
      child: BlocBuilder<TopFiveCubit, TopFiveState>(
        builder: (context, state) {
          if (state is TopFiveLoaded) {
            return Column(
              children: [
                CarouselSlider.builder(
                  itemCount:
                      state.movieModel.length < 5 ? state.movieModel.length : 5,
                  itemBuilder: (context, index, realIndex) {
                    var item = state.movieModel[index];
                    var title = item.title;
                    var imageUrl = item.posterPath;
                    String voteAverage =
                        (item.voteAverage / 2).toStringAsFixed(1);
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          RouteList.movieDetails,
                          arguments: {
                            'movie': item,
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: CachedNetworkImage(
                                  height: 500,
                                  imageUrl: ApiConstants.imageUrl + imageUrl!,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                  ),
                                  fit: BoxFit.cover,
                                  width: 1000,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Text(
                                title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  voteAverage,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                RatingBar(
                                  itemSize: 20,
                                  ignoreGestures: true,
                                  initialRating: item.voteAverage / 2,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  ratingWidget: RatingWidget(
                                    full: Image.asset(
                                        'assets/images/icons/star.png'),
                                    half: Image.asset(
                                        'assets/images/icons/star_half.png'),
                                    empty: Image.asset(
                                        'assets/images/icons/star_empty.png'),
                                  ),
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  onRatingUpdate: (_) {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                      autoPlay: false,
                      enlargeCenterPage: false,
                      aspectRatio: 16 / 11,
                      viewportFraction: 1,
                      disableCenter: true,
                      onPageChanged: (index, reason) {}),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
