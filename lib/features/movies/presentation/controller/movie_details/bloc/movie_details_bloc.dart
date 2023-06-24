import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_with_bloc/core/utils/enums.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_details_usecasae.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';

import '../../../../domain/entities/movie_recommendation.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetMovieRecommendationUseCase getMovieRecommendationUseCase;
  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getMovieRecommendationUseCase,
  }) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((_getMovieDetails));
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(id: event.id));
    result.fold(
        (failure) =>
            emit(state.copyWith(movieDetailsState: RequestState.error)),
        (data) => emit(state.copyWith(
              movieDetail: data,
              movieDetailsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieRecommendationUseCase(RecommendationParameters(event.id));
        result.fold(
            (failure) =>
                emit(state.copyWith(recommendationState: RequestState.error)),
            (data) => emit(state.copyWith(
                recommendation: data)));
    
  }
}
