part of 'actor_profile_bloc.dart';

@immutable
sealed class ActorProfileState {}

final class ActorProfileInitial extends ActorProfileState {}

final class ActorProfileLoading extends ActorProfileState {}

final class ActorProfileLoaded extends ActorProfileState {
  final ActorDto actor;

  ActorProfileLoaded(this.actor);
}

final class ActorProfileError extends ActorProfileState {}
