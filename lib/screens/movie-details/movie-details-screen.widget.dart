import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/movie_details_bloc.dart';

class MovieDetailsScreenWidget extends StatefulWidget {
  const MovieDetailsScreenWidget({Key? key}) : super(key: key);

  @override
  _MovieDetailsScreenWidgetState createState() =>
      _MovieDetailsScreenWidgetState();
}

class _MovieDetailsScreenWidgetState extends State<MovieDetailsScreenWidget> {
  MovieDetailsBloc get _movieDetailsBloc =>
      BlocProvider.of<MovieDetailsBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
