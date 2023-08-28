part of 'feed_bloc.dart';

@immutable
sealed class FeedState {}

final class FeedInitial extends FeedState {}

final class FeedLoading extends FeedState {}

final class FeedLoaded extends FeedState {
  final FeedMoviesListDto items;

  FeedLoaded(this.items);
}

final class FeedError extends FeedState {
  FeedError();
}

final class FeedMovieDetailClicked extends FeedState {
  final int movieId;

  FeedMovieDetailClicked(this.movieId);
}
