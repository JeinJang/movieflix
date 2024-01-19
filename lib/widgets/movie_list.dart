import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/widgets/movie_card.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.movies,
  });

  final Future<List<MovieModel>> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: FutureBuilder<List<MovieModel>>(
        future: movies,
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
            itemBuilder: (context, index) => MovieCard(
              imageUrl: snapshot.data![index].backdropPath,
              title: snapshot.data![index].title,
              id: snapshot.data![index].id,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
          );
        },
      ),
    );
  }
}
