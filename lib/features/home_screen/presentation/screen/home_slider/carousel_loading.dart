import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/common/api_constant.dart';
import 'package:maxopen_task/di/get_it.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/top_five/top_five_cubit.dart';

class Carousel {
  final int id;
  final String image;

  Carousel({required this.id, required this.image});
}

class CarouselSliderDataFound extends StatefulWidget {
  // final List<Carousel> carouselList;
  const CarouselSliderDataFound(
      // this.carouselList
      );

  @override
  _CarouselSliderDataFoundState createState() =>
      _CarouselSliderDataFoundState();
}

class _CarouselSliderDataFoundState extends State<CarouselSliderDataFound> {
  int _current = 0;
  late List<Widget> imageSlider;
  List<Carousel> carouselList = [
    Carousel(
        id: 1,
        image:
            'https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg'),
  ];

  @override
  void initState() {
    imageSlider = carouselList
        .map((e) => Container(
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: e.image,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                      ),
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Some Text',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TopFiveCubit>()..getTopFiveMovie(),
      child: BlocBuilder<TopFiveCubit, TopFiveState>(
        builder: (context, state) {
          if (state is TopFiveLoaded) {
            return Container(
              child: Column(
                children: [
                  CarouselSlider.builder(
                    itemCount: state.movieModel.length,
                    itemBuilder: (context, index, realIndex) {
                      var item = state.movieModel[index];
                      var title = item.title;
                      // var route = item.route;
                      var imageUrl = item.posterPath;
                      return GestureDetector(
                        onTap: () {
                          // GoRouter.of(context).go(route);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: CachedNetworkImage(
                                      height: 500,
                                      imageUrl:
                                          ApiConstants.imageUrl + imageUrl!,
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                item.voteAverage.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
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
                        // enlargeFactor: 0.2,
                        disableCenter: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                  ),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
          // context.read<TopFiveCubit>().getTopFiveMovie();
        },
      ),
    );
  }
}
