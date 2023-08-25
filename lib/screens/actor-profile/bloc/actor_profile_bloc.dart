import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:technical_test_avilatek/screens/actor-profile/contracts/actor.dto.dart';

part 'actor_profile_event.dart';
part 'actor_profile_state.dart';

class ActorProfileBloc extends Bloc<ActorProfileEvent, ActorProfileState> {
  ActorProfileBloc() : super(ActorProfileInitial()) {
    on<LoadActorProfile>((event, emit) async {
      try {
        emit(ActorProfileLoading());
        final actor = await _getActor(event.actorId);
        emit(ActorProfileLoaded(actor));
      } catch (e) {
        emit(ActorProfileError());
      }
    });
  }

  Future<ActorDto> _getActor(int actorId) async {
    //TODO: implement real call
    return ActorDto(
        adult: false,
        alsoKnownAs: ["Shameik Alti Moore"],
        biography:
            "Shameik Alti Moore (born May 4, 1995) is an American actor, singer, and rapper, of Jamaican descent.\n\nHe started off with bit roles on shows such as Tyler Perry's House of Payne, Reed Between the Lines, and Joyful Noise. In 2013, he had his first main television role on the sketch-comedy series Incredible Crew, which aired on Cartoon Network before being cancelled after one season.\n\nHe then gained recognition with his portrayal of Malcolm in the 2015 film Dope, which premiered at the 2015 Sundance Film Festival. Indiewire included Moore on its list of \"The 12 Major Breakouts of the 2015 Sundance Film Festival\" for his performance in the movie.\n\nHe is also one of the five male leads in the Netflix series The Get Down, which premiered in 2016 and was cancelled in 2017 after one half-season. He voiced Miles Morales in the animated film Spider-Man: Into the Spider-Verse from Sony Pictures Animation, which was released in December 2018.",
        birthday: "1995-05-04",
        deathday: null,
        gender: 2,
        homepage: "https://www.shameikmoore.com/",
        id: 587506,
        imdbId: "nm4271336",
        knownForDepartment: "Acting",
        name: "Shameik Moore",
        placeOfBirth: "Atlanta, Georgia, USA",
        popularity: 14.074,
        profilePath: "/uJNaSTsfBOvtFWsPP23zNthknsB.jpg");
  }
}
