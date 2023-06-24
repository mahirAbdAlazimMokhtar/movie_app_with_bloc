import 'package:movie_app_with_bloc/features/movies/data/model/geners_model.dart';
import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.overview,
      required super.releaseDate,
      required super.runtime,
      required super.title,
      required super.genres,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      genres: List<GenresModel>.from(
          json['genres'].map((x) => GenresModel.fromJson(x))),
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
