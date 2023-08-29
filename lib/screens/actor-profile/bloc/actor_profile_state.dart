part of 'actor_profile_bloc.dart';

@immutable
sealed class ActorProfileState {}

final class ActorProfileInitial extends ActorProfileState {}

final class ActorProfileLoading extends ActorProfileState {}

final class ActorProfileLoaded extends ActorProfileState {
  final ActorDto actor;

  final ActorMoviesDto movies;

  ActorProfileLoaded(this.actor, this.movies);
}

final class ActorProfileError extends ActorProfileState {}

final class ActorProfileMovieSelected extends ActorProfileState {
  final int movieId;

  ActorProfileMovieSelected(this.movieId);
}
