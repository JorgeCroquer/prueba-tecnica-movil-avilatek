import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test_avilatek/screens/feed/bloc/feed_bloc.dart';

class MockFeedBloc extends FeedBloc {}

void main() {
  group('FeedBloc', () {
    late FeedBloc feedBloc;

    setUp(() {
      feedBloc = MockFeedBloc();
    });

    blocTest<FeedBloc, FeedState>(
      'emits [FeedLoading, FeedLoaded] when FeedLoad is added',
      build: () => feedBloc,
      act: (bloc) => bloc.add(FeedLoad()),
      expect: () => [isA<FeedLoading>(), isA<FeedLoaded>()],
    );

    blocTest<FeedBloc, FeedState>(
      'emits [FeedLoading, FeedLoaded] when FeedLoadMore is added',
      build: () => feedBloc,
      act: (bloc) => bloc.add(FeedLoadMore(page: 2)),
      expect: () => [isA<FeedLoading>(), isA<FeedLoaded>()],
    );

    blocTest<FeedBloc, FeedState>(
      'emits [FeedLoading, FeedLoaded] when FeedRefresh is added',
      build: () => feedBloc,
      act: (bloc) => bloc.add(FeedRefresh()),
      expect: () => [isA<FeedLoading>(), isA<FeedLoaded>()],
    );

    //TODO: add test for error
  });
}
