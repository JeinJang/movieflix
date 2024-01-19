import 'package:flutter/material.dart';

class PopularMovie extends StatelessWidget {
  final String imageUrl;
  final int id;

  const PopularMovie({
    super.key,
    required this.imageUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 300,
        height: 200,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Image.network(
          'https://image.tmdb.org/t/p/w500$imageUrl',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
