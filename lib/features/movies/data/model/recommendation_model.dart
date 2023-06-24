import 'package:movie_app_with_bloc/features/movies/domain/entities/movie_recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({required super.backdropPath, required super.id});

  //create from json model
  
  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        backdropPath: json['backdrop_path']?? 'https://www.elegantthemes.com/blog/wp-content/uploads/2020/08/000-http-error-codes.png', id: json['id']);
  }
}
