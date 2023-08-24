import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/feed_bloc.dart';

class FeedScreenWidget extends StatefulWidget {
  const FeedScreenWidget({Key? key}) : super(key: key);

  @override
  _FeedScreenWidgetState createState() => _FeedScreenWidgetState();
}

class _FeedScreenWidgetState extends State<FeedScreenWidget> {
  FeedBloc get _feedBloc => BlocProvider.of<FeedBloc>(context);

  @override
  Widget build(BuildContext context) {
    return const Text('FeedScreenWidget');
  }
}
