import 'feed-movie.dto.dart';

class FeedMoviesListDto {
  final int page;
  final List<FeedMovieDto> results;
  final int totalPages;
  final int totalResults;

  FeedMoviesListDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory FeedMoviesListDto.fromJson(Map<String, dynamic> json) =>
      FeedMoviesListDto(
        page: json['page'],
        results: List<FeedMovieDto>.from(
            json['results'].map((x) => FeedMovieDto.fromJson(x))),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
}
