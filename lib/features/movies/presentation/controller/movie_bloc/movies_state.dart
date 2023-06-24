import 'package:equatable/equatable.dart';
import 'package:movie_app_with_bloc/core/utils/enums.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  const MoviesState(
      {this.nowPlayingMovies = const [],
      this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = '',
      this.popularMessage = '',
      this.popularMovies = const [],
      this.popularState = RequestState.loading,
      this.topRatedMessage = '',
      this.topRatedMovies = const [],
      this.topRatedState = RequestState.loading});

  //! Now Playing Movies
  final String nowPlayingMessage;
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  //! popular State
  final String popularMessage;
  final List<Movie> popularMovies;
  final RequestState popularState;

  //! top Rated State
  final String topRatedMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;

  //! copy with

  MoviesState copyWith(
      {String? nowPlayingMessage,
      List<Movie>? nowPlayingMovies,
      RequestState? nowPlayingState,
      String? popularMessage,
      List<Movie>? popularMovies,
      RequestState? popularState,
      String? topRatedMessage,
      List<Movie>? topRatedMovies,
      RequestState? topRatedState}) {
    return MoviesState(
        nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        nowPlayingState: nowPlayingState ?? this.nowPlayingState,
        popularMessage: popularMessage ?? this.popularMessage,
        popularMovies: popularMovies ?? this.popularMovies,
        popularState: popularState ?? this.popularState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        topRatedState: topRatedState ?? this.topRatedState);
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMessage,
        popularMovies,
        popularState,
        topRatedMessage,
        topRatedMovies,
        topRatedState,
      ];
}
