import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/presentation/journeys/movie_carousel/movie_data_widget.dart';
import 'package:clean_movies/presentation/widgets/movie_app_bar.dart';
import 'package:flutter/material.dart';

import 'movie_backdrop_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity?> movies;
  final int defaultIndex;
  const MovieCarouselWidget(
      {Key? key, required this.movies, required this.defaultIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),
        Column(
          children: [
            const MovieAppBar(),
            MoviePageView(
              movies: movies,
              defaultIndex: defaultIndex,
            ),
            const MovieDataWidget(),
          ],
        ),
      ],
    );
  }
}
