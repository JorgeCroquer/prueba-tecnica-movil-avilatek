part of 'actor_profile_bloc.dart';

@immutable
sealed class ActorProfileEvent {}

final class LoadActorProfile extends ActorProfileEvent {
  final int actorId;

  LoadActorProfile({required this.actorId});
}

final class ClickOnMovie extends ActorProfileEvent {
  final int movieId;

  ClickOnMovie({required this.movieId});
}
