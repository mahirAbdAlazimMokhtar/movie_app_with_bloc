import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_bloc/core/usecase/base_usecase.dart';
import 'package:movie_app_with_bloc/core/utils/enums.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/presentation/controller/movie_bloc/movies_event.dart';
import 'package:movie_app_with_bloc/features/movies/presentation/controller/movie_bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase nowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
      {required this.getPopularMoviesUseCase,
      required this.getTopRatedMoviesUseCase,
      required this.nowPlayingMoviesUseCase})
      : super(const MoviesState()) {
    //! Get Now Playing Movies Event

    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    //! Get top Rated Movies Event
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    //! Get top popular Movies Event
    on<GetPopularMoviesEvent>(_getPopularMovies);
  }





  //! Methods handle 

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await nowPlayingMoviesUseCase.call( NoParameters());

    result.fold(
        (error) => emit(state.copyWith(
            nowPlayingState: RequestState.error,
            nowPlayingMessage: error.message)),
        (movies) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovies: movies)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedMoviesUseCase.call(NoParameters());

    result.fold(
        (error) => emit(state.copyWith(
            topRatedMessage: error.message, topRatedState: RequestState.error)),
        (movies) => emit(state.copyWith(
            topRatedState: RequestState.loaded, topRatedMovies: movies)));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
     final result = await getPopularMoviesUseCase.call(NoParameters());

      result.fold(
          (error) => emit(state.copyWith(
              popularMessage: error.message, popularState: RequestState.error)),
          (movies) => emit(state.copyWith(
              popularState: RequestState.loaded, popularMovies: movies)));
  }
}
