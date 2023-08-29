import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:technical_test_avilatek/screens/actor-profile/contracts/cast-of-actor.dto.dart';

import '../../common/widgets/index.dart' as common_widgets;
import '../index.dart' as screens;

import 'bloc/actor_profile_bloc.dart';

class ActorProfileScreenWidget extends StatefulWidget {
  const ActorProfileScreenWidget({Key? key, required this.actorId})
      : super(key: key);

  final int actorId;

  @override
  _ActorProfileScreenWidgetState createState() =>
      _ActorProfileScreenWidgetState();
}

class _ActorProfileScreenWidgetState extends State<ActorProfileScreenWidget> {
  ActorProfileBloc get _actorProfileBloc =>
      BlocProvider.of<ActorProfileBloc>(context);

  Size get _screenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    _actorProfileBloc.add(LoadActorProfile(actorId: widget.actorId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ActorProfileBloc, ActorProfileState>(
        listener: (context, state) {
          if (state is ActorProfileMovieSelected) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return screens.MovieDetailsScreenWidget(
                movieId: state.movieId,
              );
            }));
          }
        },
        buildWhen: (previous, current) =>
            current is ActorProfileLoaded ||
            current is ActorProfileLoading ||
            current is ActorProfileError,
        builder: (context, state) {
          return state is ActorProfileLoaded
              ? _screenContent(state)
              : state is ActorProfileLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const Center(child: Text('Error'));
        });
  }

  Widget _screenContent(ActorProfileLoaded state) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: _screenSize.width,
                    child: common_widgets.ImageButtonWidget(
                        image: Image.asset('assets/arrow-left.png'),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: _actorInfo(state),
                ),
                SizedBox(
                  width: _screenSize.width,
                  height: 48,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 32),
                    child: Text(
                      'Casted on',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontFamily: 'Baloo',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                _movieList(state.movies.cast),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _actorInfo(ActorProfileLoaded state) {
    return SizedBox(
      height: _screenSize.height * 0.2,
      width: _screenSize.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(state.actor.imageUrl ??
                    'https://via.assets.so/img.jpg?w=80&h=80&tc=blue&bg=#cecece&t=No Pic'),
                fit: BoxFit.cover,
              ),
              shape: const OvalBorder(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: _screenSize.width * 0.5,
                height: 30,
                child: Text(
                  state.actor.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontFamily: 'Baloo',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: _screenSize.width * 0.65,
                height: 98,
                child: Text(
                  state.actor.biography == ''
                      ? 'No biography found'
                      : state.actor.biography,
                  style: const TextStyle(
                    color: Color(0xFF030303),
                    fontSize: 12,
                    fontFamily: 'Baloo2',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _movieList(final List<CastingOfActorDto> items) {
    const double offset = 36;

    return common_widgets.MovieFeedWidget(
      offset: offset,
      items: _buildCards(items),
    );
  }

  List<common_widgets.ContentCardWidget> _buildCards(
      final List<CastingOfActorDto> items) {
    return items
        .map((item) => common_widgets.ContentCardWidget(
              imageUrl: item.imageUrl ??
                  'https://via.assets.so/img.jpg?w=120&h=220&tc=blue&bg=#cecece&t=No-Pic',
              title: item.title,
              subtitle: '${(item.voteAverage * 10).toInt()}% User Score',
              onClicked: () {
                _actorProfileBloc.add(ClickOnMovie(movieId: item.id));
              },
            ))
        .toList();
  }
}
