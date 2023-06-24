import 'package:dio/dio.dart';
import 'package:movie_app_with_bloc/core/error/exceptions.dart';
import 'package:movie_app_with_bloc/core/network/api_constance.dart';
import 'package:movie_app_with_bloc/core/network/error_message_model.dart';
import 'package:movie_app_with_bloc/features/movies/data/model/movie_details_model.dart';
import 'package:movie_app_with_bloc/features/movies/data/model/movie_model.dart';
import 'package:movie_app_with_bloc/features/movies/data/model/recommendation_model.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_details_usecasae.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getNowPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameters parameters);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMovie);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getNowPopularMovies() async {
    final response = await Dio().get(ApiConstance.getPopularMovie);
    if (response.statusCode == 200) {
      return List<MovieModel>.of((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.getTopRatedMovie);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(parameters.id));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
  
  @override
  Future<List<RecommendationModel>> getRecommendationMovies(RecommendationParameters parameters)async {
 final response = await Dio().get(ApiConstance.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
