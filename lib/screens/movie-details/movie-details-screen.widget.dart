import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widgets/index.dart' as common_widgets;
import '../../screens/index.dart' as screens;

import 'bloc/movie_details_bloc.dart';

class MovieDetailsScreenWidget extends StatefulWidget {
  const MovieDetailsScreenWidget({Key? key, required this.movieId})
      : super(key: key);

  final int movieId;

  @override
  _MovieDetailsScreenWidgetState createState() =>
      _MovieDetailsScreenWidgetState();
}

class _MovieDetailsScreenWidgetState extends State<MovieDetailsScreenWidget> {
  MovieDetailsBloc get _movieDetailsBloc =>
      BlocProvider.of<MovieDetailsBloc>(context);

  Size get _screenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    _movieDetailsBloc.add(MovieDetailsLoadEvent(movieId: widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailsBloc, MovieDetailsState>(
      bloc: _movieDetailsBloc,
      listener: (context, state) => state is ActorClicked
          ? Navigator.push(context, MaterialPageRoute(builder: (context) {
              return screens.ActorProfileScreenWidget(
                actorId: state.actorId,
              );
            }))
          : null,
      buildWhen: (previous, current) =>
          current is MovieDetailsLoaded ||
          current is MovieDetailsLoading ||
          current is MovieDetailsError,
      builder: (context, state) {
        return state is MovieDetailsLoaded
            ? _screenContent(state)
            : state is MovieDetailsLoading
                ? const Center(child: CircularProgressIndicator())
                : const Center(child: Text('Error'));
      },
    );
  }

  Widget _screenContent(MovieDetailsLoaded state) {
    // A Screen with a Image as background
    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(state),
          _cancelButton(),
          _titleText(state),
          _subtitleText(state),
          _actorsList(state),
        ],
      ),
    );
  }

  Widget _backgroundImage(MovieDetailsLoaded state) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        width: _screenSize.width,
        height: _screenSize.height,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: NetworkImage(state.movieDetailsDto.imageUrl!),
            fit: BoxFit.cover,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _cancelButton() {
    return Positioned(
      left: 11,
      top: 41,
      child: common_widgets.ImageButtonWidget(
        image: Image.asset('assets/cancel-button.png'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const screens.FeedScreenWidget();
          }));
        },
      ),
    );
  }

  Widget _titleText(MovieDetailsLoaded state) {
    return Positioned(
      left: 11,
      top: _screenSize.height * 0.6,
      child: SizedBox(
        width: _screenSize.width,
        height: 50,
        child: Text(
          state.movieDetailsDto.title,
          style: const TextStyle(
              overflow: TextOverflow.visible,
              color: Colors.white,
              fontFamily: 'Baloo',
              fontSize: 36,
              fontWeight: FontWeight.w700,
              height: 1.05),
          maxLines: 2,
        ),
      ),
    );
  }

  Widget _subtitleText(MovieDetailsLoaded state) {
    return Positioned(
      left: 11,
      top: _screenSize.height * 0.6 + 90,
      child: SizedBox(
        width: _screenSize.width,
        height: 30,
        child: Text(
          '${(state.movieDetailsDto.voteAverage * 10).toInt()}% User\'s score',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Baloo2',
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _actorsList(MovieDetailsLoaded state) {
    return Positioned(
      left: 11,
      top: _screenSize.height * 0.6 + 100,
      child: SizedBox(
          width: _screenSize.width * 0.95,
          height: 250,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: _actorCards(state).sublist(0, 3),
          )),
    );
  }

  List<Widget> _actorCards(MovieDetailsLoaded state) {
    return state.movieCastingDto.cast.map((castMember) {
      return common_widgets.ContentCardWidget(
        title: castMember.name,
        subtitle: castMember.character,
        imageUrl: castMember.imageUrl ?? '',
        cardSize: const Size(113.25, 163.5),
        onClicked: () {
          _movieDetailsBloc.add(ClickOnActorEvent(actorId: castMember.id));
        },
      );
    }).toList();
  }
}
