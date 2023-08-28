import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_test_avilatek/common/contracts/movie-casting.dto.dart';

import '../contracts/movie-details.dto.dart';
import '../services/movie-details.service.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsService _movieDetailsService;

  MovieDetailsBloc({
    required MovieDetailsService movieDetailsService,
  })  : _movieDetailsService = movieDetailsService,
        super(MovieDetailsInitial()) {
    on<MovieDetailsLoadEvent>((event, emit) async {
      try {
        emit(MovieDetailsLoading());
        final movieDetailsDto = await _getMovieDetails(event.movieId);
        final movieCastDto = await _getMovieCasting(event.movieId);
        emit(MovieDetailsLoaded(
            movieDetailsDto: movieDetailsDto, movieCastingDto: movieCastDto));
      } catch (_) {
        emit(MovieDetailsError());
      }
    });
  }

  Future<MovieDetailsDto> _getMovieDetails(int movieId) async {
    return await _movieDetailsService.getDetailsOfMovie(movieId);
  }

  Future<MovieCastingDto> _getMovieCasting(int movieId) async {
    return await _movieDetailsService.getCastingOfMovie(movieId);
  }
}
