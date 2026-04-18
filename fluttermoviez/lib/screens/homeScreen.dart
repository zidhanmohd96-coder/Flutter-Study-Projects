import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tvShows = [];
  final String apiKey = '34c37bd64312c3ef34e4ee7b77eea3f2';
  final readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzNGMzN2JkNjQzMTJjM2VmMzRlNGVlN2I3N2VlYTNmMiIsIm5iZiI6MTc3NjUwMjI5Ny42MDUsInN1YiI6IjY5ZTM0NjE5NmVjZjA4MzRjZTI0ZmU0YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y9fAbXYnIbeEKr5LAAZjbm5KqhZQoTRJ662vLLu4nTs';

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedMoviesResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedMoviesResult['results'];
      tvShows = tvShowsResult['results'];
    });
    print(trendingMovies);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Moviez',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: const Center(child: Text('Welcome to Flutter Moviez!')),
    );
  }
}
