import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app_with_bloc/core/error/failures.dart';
import 'package:movie_app_with_bloc/core/usecase/base_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_details.dart';
import 'package:movie_app_with_bloc/features/movies/domain/repository/movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final MovieRepository movieRepository;

  GetMovieDetailsUseCase({required this.movieRepository});
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async {
    return await movieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});
  
  @override

  List<Object?> get props =>[id];

}
