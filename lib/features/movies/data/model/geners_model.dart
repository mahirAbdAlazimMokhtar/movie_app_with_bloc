import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_details.dart';

class GenresModel extends Genres {
  const GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      name: json['name'],
      id: json['id'],
    );
  }
}
