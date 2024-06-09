import 'package:netflix/core/strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$apiKey";
  static const search = '$kBaseUrl/search/movie?api_key=$apiKey';
  static const homeBg = '$kBaseUrl/movie/popular?api_key=$apiKey';
  static const homeLatestMovies = '$kBaseUrl/discover/movie?api_key=$apiKey';
  static const homeTvShows = '$kBaseUrl/tv/top_rated?api_key=$apiKey';
  static const homeDrama =
      '$kBaseUrl/discover/movie?api_key=$apiKey&with_genres=18&sort_by=popularity.desc&vote_average.gte=7';
}
