import 'genre.dto.dart';
import 'production-company.dto.dart';
import 'production-country.dto.dart';
import 'spoken-language.dto.dart';

class MovieDetailsDto {
  final bool adult;
  final String? backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<GenreDto> genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<ProductionCompanyDto> productionCompanies;
  final List<ProductionCountryDto> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguageDto> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  String? imageUrl;

  MovieDetailsDto({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.imageUrl,
  });

  factory MovieDetailsDto.fromJson(Map<String, dynamic> json) =>
      MovieDetailsDto(
        adult: json['adult'],
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'],
        budget: json['budget'],
        genres: List<GenreDto>.from(
            json['genres'].map((x) => GenreDto.fromJson(x))),
        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'].toDouble(),
        posterPath: json['poster_path'],
        productionCompanies: List<ProductionCompanyDto>.from(
            json['production_companies']
                .map((x) => ProductionCompanyDto.fromJson(x))),
        productionCountries: List<ProductionCountryDto>.from(
            json['production_countries']
                .map((x) => ProductionCountryDto.fromJson(x))),
        releaseDate: json['release_date'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        spokenLanguages: List<SpokenLanguageDto>.from(
            json['spoken_languages'].map((x) => SpokenLanguageDto.fromJson(x))),
        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );
}
