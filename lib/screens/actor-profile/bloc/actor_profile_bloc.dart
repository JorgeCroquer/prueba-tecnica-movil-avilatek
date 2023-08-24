import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'actor_profile_event.dart';
part 'actor_profile_state.dart';

class ActorProfileBloc extends Bloc<ActorProfileEvent, ActorProfileState> {
  ActorProfileBloc() : super(ActorProfileInitial()) {
    on<ActorProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
