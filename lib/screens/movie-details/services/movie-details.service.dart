import 'package:technical_test_avilatek/common/contracts/movie-casting.dto.dart';
import 'package:technical_test_avilatek/common/services/api.service.dart';
import 'package:technical_test_avilatek/screens/movie-details/contracts/movie-details.dto.dart';

class MovieDetailsService {
  final MoviesApiService _apiService;

  MovieDetailsService(this._apiService);

  Future<MovieDetailsDto> getDetailsOfMovie(final int movieId) async {
    final response = await _apiService.get('/movie/$movieId');

    final movieWithoutImage = MovieDetailsDto.fromJson(response);

    return await _attachMovieImageUrl(movieWithoutImage);
  }

  Future<MovieCastingDto> getCastingOfMovie(final int movieId) async {
    final response = await _apiService.get('/movie/$movieId/credits');

    final castingWithoutImage = MovieCastingDto.fromJson(response);

    return await _attachCastImageUrl(castingWithoutImage);
  }

  Future<MovieDetailsDto> _attachMovieImageUrl(
      final MovieDetailsDto details) async {
    if (details.posterPath != null) {
      details.imageUrl = await _apiService.getImageUrl(details.posterPath!,
          quality: ImageQuality.high);
    }

    return details;
  }

  Future<MovieCastingDto> _attachCastImageUrl(
      final MovieCastingDto casting) async {
    for (final cast in casting.cast) {
      if (cast.profilePath != null) {
        cast.imageUrl = await _apiService.getImageUrl(cast.profilePath!);
      }
    }
    return casting;
  }
}
