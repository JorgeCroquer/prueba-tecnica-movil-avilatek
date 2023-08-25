import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../contracts/feed-movie.dto.dart';
import '../contracts/popular-movies-list.dto.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc() : super(FeedInitial()) {
    on<FeedLoad>((_, emit) async {
      try {
        emit(FeedLoading());
        final movieList = await _getFeed(1);
        emit(FeedLoaded(movieList));
      } catch (_) {
        emit(FeedError());
      }
    });

    on<FeedLoadMore>((event, emit) async {
      try {
        emit(FeedLoading());
        final movieList = await _getFeed(event.page);
        emit(FeedLoaded(movieList));
      } catch (_) {
        emit(FeedError());
      }
    });

    on<FeedRefresh>((_, emit) async {
      try {
        emit(FeedLoading());
        final movieList = await _getFeed(1);
        emit(FeedLoaded(movieList));
      } catch (_) {
        emit(FeedError());
      }
    });
  }

  Future<FeedMoviesListDto> _getFeed(final int page) async {
    //TODO: implement real call
    return FeedMoviesListDto(
      page: page,
      results: [
        FeedMovieDto(
            id: 1,
            title: 'Title',
            overview: 'Overview',
            posterPath: 'PosterPath',
            backdropPath: 'BackdropPath',
            releaseDate: DateTime.now().toString(),
            voteAverage: 1,
            adult: false,
            genreIds: [],
            originalLanguage: 'es',
            originalTitle: 'sff',
            popularity: 1,
            video: false,
            voteCount: 1),
      ],
      totalPages: 1,
      totalResults: 1,
    );
  }
}
