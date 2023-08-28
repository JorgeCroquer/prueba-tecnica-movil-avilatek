import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/feed_bloc.dart';

import '../../common/widgets/index.dart' as common_widgets;
import 'contracts/feed-movie.dto.dart';

class FeedScreenWidget extends StatefulWidget {
  const FeedScreenWidget({Key? key}) : super(key: key);

  @override
  _FeedScreenWidgetState createState() => _FeedScreenWidgetState();
}

class _FeedScreenWidgetState extends State<FeedScreenWidget> {
  FeedBloc get _feedBloc => BlocProvider.of<FeedBloc>(context);

  Size get _screenSize => MediaQuery.of(context).size;

  void onRefresh() {
    _feedBloc.add(FeedRefresh());
  }

  @override
  void initState() {
    super.initState();
    _feedBloc.add(FeedLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      bloc: _feedBloc,
      buildWhen: (previous, current) =>
          current is FeedLoaded ||
          current is FeedLoading ||
          current is FeedError,
      builder: (context, state) {
        return state is FeedLoaded
            ? screenContent(state)
            : state is FeedLoading
                ? const Center(child: CircularProgressIndicator())
                : const Center(child: Text('Error'));
      },
    );
  }

  Widget screenContent(FeedLoaded state) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            _feedBloc.add(FeedRefresh());
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _header(),
                _feedList(state.items.results),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
                onPressed: () {},
                icon: Image.asset('assets/hamburger-button.png')),
          ),
          const Text(
            'Latest',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Baloo',
              fontWeight: FontWeight.w400,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: SizedBox(
              width: 50,
              height: 50,
            ),
          )
        ],
      ),
    );
  }

  Widget _feedList(final List<FeedMovieDto> items) {
    const double offset = 36;

    return common_widgets.MovieFeedWidget(offset: offset, items: items);
  }
}
