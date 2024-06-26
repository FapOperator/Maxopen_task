import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/domain/repository/now_playing_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'latest_state.dart';

class LatestCubit extends Cubit<LatestState> {
  final NowPlayingRepository _nowPlayingRepository;
  LatestCubit(
    this._nowPlayingRepository,
  ) : super(LatestInitial());

  Future<void> getTopFiveMovie(String locale) async {
    print(locale);
    List<Movie> result =
        await _nowPlayingRepository.getNowPlayingMovies(locale);
    emit(LatestLoaded(
      movieModel: result,
    ));
  }
}
