import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxopen_task/core/common/conver_locale_string.dart';
import 'package:maxopen_task/core/di/get_it.dart';
import 'package:maxopen_task/features/global_widget/movie_card.dart';
import 'package:maxopen_task/features/home_screen/presentation/theme/app_color.dart';
import 'package:maxopen_task/features/home_screen/presentation/widgets/custom_title.dart';
import 'package:maxopen_task/features/search/presentation/bloc/search_cubit/search_cubit.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController searchController = TextEditingController();
    String locale = convertLocaleString(context);
    return Scaffold(
      backgroundColor: AppColor.background,
      body: BlocProvider(
        create: (context) => getIt<SearchCubit>(),
        child: Builder(builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomTitle(
                    title: AppLocalizations.of(context)!.search,
                    isGoBack: true,
                  ),
                  FocusScope(
                    onFocusChange: (value) {
                      if (!value) {
                        context
                            .read<SearchCubit>()
                            .searchMovie(searchController.text, locale);
                      }
                    },
                    child: Form(
                      key: formKey,
                      child: TextFormField(
                        controller: searchController,
                        cursorColor: AppColor.assent,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                        onTapOutside: ((event) {
                          FocusScope.of(context).unfocus();
                        }),
                        onSaved: (newValue) {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<SearchCubit>()
                                .searchMovie(searchController.text, locale);
                          }
                        },
                        onEditingComplete: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<SearchCubit>()
                                .searchMovie(searchController.text, locale);
                          }
                          FocusScope.of(context).unfocus();
                        },
                        validator: (value) {
                          if (value!.length <= 3) {
                            return 'Please enter at least 3 characters';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(23),
                          filled: true,
                          fillColor: const Color(0xFF2B2B2B),
                          prefixIcon: IconButton(
                            enableFeedback: false,
                            icon: Image.asset(
                              width: 20,
                              height: 20,
                              'assets/images/icons/search_outline.png',
                            ),
                            onPressed: () {},
                          ),
                          hintText: AppLocalizations.of(context)!.search,
                          hintStyle: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.2),
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColor.assent),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoaded) {
                        return Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 15,
                                ),
                                child: Text(
                                  '${AppLocalizations.of(context)!.searchResult} (${state.movie.length})',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                    itemCount: state.movie.length,
                                    itemBuilder: (context, index) {
                                      return MovieCard(
                                          movie: state.movie[index]);
                                    }),
                              ),
                            ],
                          ),
                        );
                      }
                      return const Text('empty');
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
