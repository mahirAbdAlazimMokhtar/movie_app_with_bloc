import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_bloc/core/error/failures.dart';
import 'package:movie_app_with_bloc/core/usecase/base_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_recommendation.dart';
import 'package:movie_app_with_bloc/features/movies/domain/repository/movies_repository.dart';

class GetMovieRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final MovieRepository movieRepository;

  GetMovieRecommendationUseCase({ required this.movieRepository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await movieRepository.getMovieRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
