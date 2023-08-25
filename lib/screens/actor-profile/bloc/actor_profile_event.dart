part of 'actor_profile_bloc.dart';

@immutable
sealed class ActorProfileEvent {}

final class LoadActorProfile extends ActorProfileEvent {
  final int actorId;

  LoadActorProfile(this.actorId);
}
