import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../contracts/feed-movies-list.dto.dart';
import '../services/feed.service.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  final FeedService _feedService;

  FeedBloc({
    required FeedService feedService,
  })  : _feedService = feedService,
        super(FeedInitial()) {
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
    return await _feedService.getFeed(page);
  }
}
