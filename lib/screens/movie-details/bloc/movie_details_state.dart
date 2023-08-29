part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsDto movieDetailsDto;
  final MovieCastingDto movieCastingDto;

  MovieDetailsLoaded({
    required this.movieDetailsDto,
    required this.movieCastingDto,
  });
}

final class MovieDetailsError extends MovieDetailsState {}

final class ActorClicked extends MovieDetailsState {
  final int actorId;

  ActorClicked({required this.actorId});
}
