part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsEvent {}

final class MovieDetailsLoadEvent extends MovieDetailsEvent {
  final int movieId;

  MovieDetailsLoadEvent({required this.movieId});
}

final class ClickOnActorEvent extends MovieDetailsEvent {
  final int actorId;

  ClickOnActorEvent({required this.actorId});
}
