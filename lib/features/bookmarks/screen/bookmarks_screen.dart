import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/core/di/get_it.dart';
import 'package:maxopen_task/features/global_widget/movie_card.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/movie_detail/favourite/favourite_cubit.dart';
import 'package:maxopen_task/core/theme/app_color.dart';
import 'package:maxopen_task/features/home_screen/presentation/widgets/custom_title.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  late FavouriteCubit _favouriteCubit;

  @override
  void initState() {
    super.initState();
    _favouriteCubit = getIt<FavouriteCubit>();
    _favouriteCubit.getFavoriteMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: BlocProvider<FavouriteCubit>(
        create: (context) => _favouriteCubit,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomTitle(
                  title: AppLocalizations.of(context)!.bookmarks,
                  isGoBack: true,
                ),
                BlocBuilder<FavouriteCubit, FavouriteState>(
                  builder: (context, state) {
                    if (state is LoadFavoriteMovie) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.movie.length,
                          itemBuilder: (context, index) {
                            return MovieCard(movie: state.movie[index]);
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
