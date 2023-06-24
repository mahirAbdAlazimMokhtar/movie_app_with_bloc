import 'package:dartz/dartz.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_details_usecasae.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';

import '../../../../core/error/failures.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>>  getNowPlaying();
  Future<Either<Failure, List<Movie>>>  getPopularMovies();
  Future<Either<Failure, List<Movie>>>  getTopRatedMovies();
  Future<Either<Failure, MovieDetail>>  getMovieDetails(MovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>>  getMovieRecommendation(RecommendationParameters parameters);
}
