import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test_avilatek/screens/movie-details/bloc/movie_details_bloc.dart';

class MockMovieDetailsBloc extends MovieDetailsBloc {}

void main() {
  group('MovieDetailsBloc', () {
    late MovieDetailsBloc movieDetailsBloc;

    setUp(() {
      movieDetailsBloc = MockMovieDetailsBloc();
    });

    blocTest<MovieDetailsBloc, MovieDetailsState>(
      'emits [MovieDetailsLoading, MovieDetailsLoaded] when MovieDetailsLoadEvent is added',
      build: () => movieDetailsBloc,
      act: (bloc) => bloc.add(MovieDetailsLoadEvent(movieId: 1)),
      expect: () => [isA<MovieDetailsLoading>(), isA<MovieDetailsLoaded>()],
    );
  });
}
