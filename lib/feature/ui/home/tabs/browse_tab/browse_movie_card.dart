import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_colors.dart';
import 'package:movie_app/domain/categories/entites/categories_response_entity.dart';

class MovieCard extends StatelessWidget {
  final CategoriesMoviesEntity movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            buildMovieImage(),
            buildGradientOverlay(),
            buildRating(),
            buildMovieTitle(),
          ],
        ),
      ),
    );
  }

  Widget buildMovieImage() {
    return CachedNetworkImage(
      imageUrl: movie.backgroundImage ?? "",
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[800],
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[900],
        child: const Icon(Icons.error, color: Colors.white),
      ),
    );
  }

  Widget buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRating() {
    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.yellowColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              "${movie.rating?.toStringAsFixed(1) ?? '0.0'}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.star,
              color: Colors.black,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMovieTitle() {
    return Positioned(
      bottom: 8,
      left: 8,
      right: 8,
      child: Text(
        movie.title ?? "",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}