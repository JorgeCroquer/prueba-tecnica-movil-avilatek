import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/actor_profile_bloc.dart';

class ActorProfileScreenWidget extends StatefulWidget {
  const ActorProfileScreenWidget({Key? key}) : super(key: key);

  @override
  _ActorProfileScreenWidgetState createState() =>
      _ActorProfileScreenWidgetState();
}

class _ActorProfileScreenWidgetState extends State<ActorProfileScreenWidget> {
  ActorProfileBloc get _actorProfileBloc =>
      BlocProvider.of<ActorProfileBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
