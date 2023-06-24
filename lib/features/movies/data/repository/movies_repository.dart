import 'package:dartz/dartz.dart';
import 'package:movie_app_with_bloc/core/error/exceptions.dart';
import 'package:movie_app_with_bloc/core/error/failures.dart';
import 'package:movie_app_with_bloc/features/movies/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app_with_bloc/features/movies/domain/repository/movies_repository.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_details_usecasae.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';

class MovieRepositoryImp extends MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImp({required this.movieRemoteDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await movieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await movieRemoteDataSource.getNowPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await movieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await movieRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getMovieRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await movieRemoteDataSource.getRecommendationMovies(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
