part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsLoading extends MovieDetailsState {}

final class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetailsDto movieDetailsDto;

  MovieDetailsLoaded({required this.movieDetailsDto});
}

final class MovieDetailsError extends MovieDetailsState {}
