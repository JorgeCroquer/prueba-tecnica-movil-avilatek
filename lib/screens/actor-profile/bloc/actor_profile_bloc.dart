import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_test_avilatek/screens/actor-profile/contracts/actor-movies.dto.dart';
import 'package:technical_test_avilatek/screens/actor-profile/contracts/actor.dto.dart';

import '../services/actor-profile.service.dart';

part 'actor_profile_event.dart';
part 'actor_profile_state.dart';

class ActorProfileBloc extends Bloc<ActorProfileEvent, ActorProfileState> {
  final ActorProfileService _actorProfileService;

  ActorProfileBloc({required ActorProfileService actorProfileService})
      : _actorProfileService = actorProfileService,
        super(ActorProfileInitial()) {
    on<LoadActorProfile>((event, emit) async {
      try {
        emit(ActorProfileLoading());
        final futures = [
          _getActor(event.actorId),
          _getActorMovies(event.actorId)
        ];
        final results = await Future.wait(futures);
        final actor = results[0] as ActorDto;
        final movies = results[1] as ActorMoviesDto;
        emit(ActorProfileLoaded(actor, movies));
      } catch (e) {
        print(e);
        emit(ActorProfileError());
      }
    });

    on<ClickOnMovie>((event, emit) {
      emit(ActorProfileMovieSelected(event.movieId));
    });
  }

  Future<ActorDto> _getActor(int actorId) async {
    //TODO: implement real call
    return await _actorProfileService.getActorInfo(actorId);
  }

  Future<ActorMoviesDto> _getActorMovies(int actorId) async {
    return await _actorProfileService.getActorMovies(actorId);
  }
}
