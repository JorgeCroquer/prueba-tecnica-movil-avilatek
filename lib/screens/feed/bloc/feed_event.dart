part of 'feed_bloc.dart';

@immutable
sealed class FeedEvent {}

final class FeedLoad extends FeedEvent {}

final class FeedLoadMore extends FeedEvent {
  final int page;

  FeedLoadMore({required this.page});
}

final class FeedRefresh extends FeedEvent {}
