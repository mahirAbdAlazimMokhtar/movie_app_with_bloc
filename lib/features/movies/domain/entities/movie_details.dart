import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final List<Genres> genres;

  const MovieDetail(
      {required this.backdropPath,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.runtime,
      required this.title,
      required this.genres,
      required this.voteAverage});

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        overview,
        releaseDate,
        runtime,
        title,
        genres,
        voteAverage,
      ];
}

class Genres extends Equatable {
  final String name;
  final int id;

  const Genres({required this.name, required this.id});

  @override
  List<Object?> get props => [
        name,
        id,
      ];
}
