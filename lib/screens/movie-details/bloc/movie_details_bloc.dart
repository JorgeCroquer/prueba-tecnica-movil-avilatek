import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../contracts/genre.dto.dart';
import '../contracts/movie-details.dto.dart';
import '../contracts/production-company.dto.dart';
import '../contracts/production-country.dto.dart';
import '../contracts/spoken-language.dto.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<MovieDetailsLoadEvent>((event, emit) async {
      try {
        emit(MovieDetailsLoading());
        final movieDetailsDto = await _getMovieDetails(event.movieId);
        emit(MovieDetailsLoaded(movieDetailsDto: movieDetailsDto));
      } catch (_) {
        emit(MovieDetailsError());
      }
    });
  }

  Future<MovieDetailsDto> _getMovieDetails(int movieId) async {
    //TODO: implement real call to API
    return MovieDetailsDto(
        adult: false,
        backdropPath: "/jZIYaISP3GBSrVOPfrp98AMa8Ng.jpg",
        belongsToCollection: null,
        budget: 200000000,
        genres: [
          GenreDto(id: 16, name: "Animation"),
          GenreDto(id: 35, name: "Comedy"),
          GenreDto(id: 10751, name: "Family"),
          GenreDto(id: 14, name: "Fantasy"),
          GenreDto(id: 10749, name: "Romance")
        ],
        homepage: "https://movies.disney.com/elemental",
        id: 976573,
        imdbId: "tt15789038",
        originalLanguage: "en",
        originalTitle: "Elemental",
        overview:
            "In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.",
        popularity: 3832.175,
        posterPath: "/8riWcADI1ekEiBguVB9vkilhiQm.jpg",
        productionCompanies: [
          ProductionCompanyDto(
              id: 2,
              logoPath: "/wdrCwmRnLFJhEoH8GSfymY85KHT.png",
              name: "Walt Disney Pictures",
              originCountry: "US"),
          ProductionCompanyDto(
              id: 3,
              logoPath: "/1TjvGVDMYsj6JBxOAkUHpPEwLf7.png",
              name: "Pixar",
              originCountry: "US")
        ],
        productionCountries: [
          ProductionCountryDto(iso31661: "US", name: "United States of America")
        ],
        releaseDate: "2023-06-14",
        revenue: 458822015,
        runtime: 102,
        spokenLanguages: [
          SpokenLanguageDto(
              englishName: "English", iso6391: "en", name: "English"),
          SpokenLanguageDto(
              englishName: "Spanish", iso6391: "es", name: "Español")
        ],
        status: "Released",
        tagline: "Opposites react.",
        title:
            "Elemental", // The title of the movie in the language specified by the user.
        video:
            false, // Whether or not the movie has a video associated with it (e.g. a trailer).
        voteAverage:
            7.798, // The average rating of the movie on a scale from one to ten.
        voteCount:
            1378 // The number of votes that have been cast for the movie by users.
        );
  }
}
