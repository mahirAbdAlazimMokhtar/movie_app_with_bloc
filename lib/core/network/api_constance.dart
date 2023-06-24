class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "f14f0dd2f06f8c329b32ef6665a81542";
  static const String nowPlayingMovie =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String getPopularMovie =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String getTopRatedMovie =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  // string method  to return movieId
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey"; 


      static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";



  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';
}
