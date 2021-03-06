import 'package:equatable/equatable.dart';

import 'movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(MovieDetailEntity entity) {
    return MovieEntity(
      backdropPath: entity.backdropPath!,
      id: entity.id,
      posterPath: entity.posterPath!,
      title: entity.title,
      voteAverage: entity.voteAverage!,
      releaseDate: entity.releaseDate!,
      overview: entity.overview!,
    );
  }

  static MovieEntity? empty() {}
}
