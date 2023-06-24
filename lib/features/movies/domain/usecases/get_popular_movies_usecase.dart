import 'package:dartz/dartz.dart';
import 'package:movie_app_with_bloc/core/usecase/base_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie.dart';
import 'package:movie_app_with_bloc/features/movies/domain/repository/movies_repository.dart';

import '../../../../core/error/failures.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters>{
  final MovieRepository movieRepository;

  GetPopularMoviesUseCase(this.movieRepository);
  @override
  Future<Either<Failure, List<Movie>>>  call(NoParameters parameters) async {
    return await movieRepository.getPopularMovies();
  }
}
