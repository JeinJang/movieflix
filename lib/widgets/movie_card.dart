import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String imageUrl, title;
  final int id;

  const MovieCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            'https://image.tmdb.org/t/p/w500$imageUrl',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 200,
          child: Text(
            title,
            softWrap: true,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
