import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'screens/actor-profile/bloc/actor_profile_bloc.dart';
import 'screens/feed/bloc/feed_bloc.dart';
import 'screens/movie-details/bloc/movie_details_bloc.dart';

import 'screens/index.dart' as screens;

Future<void> main() async {
  final List<BlocProvider> blocs = [
    BlocProvider<ActorProfileBloc>(create: (_) => ActorProfileBloc()),
    BlocProvider<FeedBloc>(create: (_) => FeedBloc()),
    BlocProvider<MovieDetailsBloc>(create: (_) => MovieDetailsBloc()),
  ];

  await dotenv.load(fileName: '.env');

  runApp(MultiBlocProvider(providers: blocs, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technical Test Avilatek',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 216, 177)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final Widget home = const screens.FeedScreenWidget();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.home,
    );
  }
}
