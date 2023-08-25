import 'package:technical_test_avilatek/common/services/api.service.dart';
import 'package:technical_test_avilatek/screens/feed/contracts/feed-movie.dto.dart';

import '../contracts/feed-movies-list.dto.dart';

class FeedService {
  final MoviesApiService _apiService;

  FeedService(this._apiService);

  Future<FeedMoviesListDto> getFeed(final int page) async {
    final response = await _apiService.get('/movie/popular', queryParameters: {
      'page': page.toString(),
    });
    final moviesWithoutImage = FeedMoviesListDto.fromJson(response);

    return await _attachImageUrl(moviesWithoutImage);
  }

  Future<FeedMoviesListDto> _attachImageUrl(
      final FeedMoviesListDto moviesList) async {
    final List<FeedMovieDto> moviesWithImage =
        await Future.wait(moviesList.results.map((movie) async {
      movie.imageUrl = await _apiService.getImageUrl(movie.posterPath);
      return movie;
    }).toList());

    return FeedMoviesListDto(
      page: moviesList.page,
      results: moviesWithImage,
      totalPages: moviesList.totalPages,
      totalResults: moviesList.totalResults,
    );
  }
}
