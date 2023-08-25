import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:technical_test_avilatek/screens/actor-profile/bloc/actor_profile_bloc.dart';

class MockActorProfileBloc extends ActorProfileBloc {}

void main() {
  group('ActorProfileBloc', () {
    late ActorProfileBloc actorProfileBloc;

    setUp(() {
      actorProfileBloc = MockActorProfileBloc();
    });

    blocTest<ActorProfileBloc, ActorProfileState>(
      'emits [ActorProfileLoading, ActorProfileLoaded] when LoadActorProfile is added',
      build: () => actorProfileBloc,
      act: (bloc) => bloc.add(LoadActorProfile(actorId: 1)),
      expect: () => [isA<ActorProfileLoading>(), isA<ActorProfileLoaded>()],
    );
  });
}
