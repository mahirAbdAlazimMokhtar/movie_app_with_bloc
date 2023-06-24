import 'package:get_it/get_it.dart';
import 'package:movie_app_with_bloc/features/movies/data/data_source/remote_data_source/movie_remote_data_source.dart';
import 'package:movie_app_with_bloc/features/movies/data/repository/movies_repository.dart';
import 'package:movie_app_with_bloc/features/movies/domain/repository/movies_repository.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_details_usecasae.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_movie_recommendation_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app_with_bloc/features/movies/presentation/controller/movie_bloc/movies_bloc.dart';
import 'package:movie_app_with_bloc/features/movies/presentation/controller/movie_details/bloc/movie_details_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //! Bloc
    sl.registerFactory(() => MoviesBloc(
        nowPlayingMoviesUseCase: sl(),
        getPopularMoviesUseCase: sl(),
        getTopRatedMoviesUseCase: sl()));

    sl.registerFactory(() => 
    MovieDetailsBloc(getMovieDetailsUseCase: sl(),
    getMovieRecommendationUseCase: sl()));

    //! Data Source
    sl.registerLazySingleton<MovieRemoteDataSource>(
        () => MovieRemoteDataSourceImpl());

    //! Repository
    sl.registerLazySingleton<MovieRepository>(
        () => MovieRepositoryImp(movieRemoteDataSource: sl()));

    //! use case

    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton(
        () => GetMovieDetailsUseCase(movieRepository: sl())); 
        sl.registerLazySingleton(
        () => GetMovieRecommendationUseCase(movieRepository: sl()));
  }
}
