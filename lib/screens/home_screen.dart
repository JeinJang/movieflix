import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_services.dart';
import 'package:movieflix/widgets/movie_list.dart';
import 'package:movieflix/widgets/popular_movie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> upcomingMovies =
      ApiService.getUpcomingMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 130,
            ),
            const CarouselTitle(title: 'Popular Movies'),
            SizedBox(
              height: 200,
              child: FutureBuilder<List<MovieModel>>(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (context, index) => PopularMovie(
                      imageUrl: snapshot.data![index].backdropPath,
                      id: snapshot.data![index].id,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const CarouselTitle(title: 'Now in Cinemas'),
            MovieList(movies: nowPlayingMovies),
            const CarouselTitle(title: 'Coming Soon'),
            MovieList(movies: upcomingMovies),
          ],
        ),
      ),
    );
  }
}

class CarouselTitle extends StatelessWidget {
  final String title;
  const CarouselTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
