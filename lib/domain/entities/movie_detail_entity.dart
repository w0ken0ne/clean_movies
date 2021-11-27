import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final String id;
  final String title;
  final String releaseDate;
  final String overview;
  final num voteAverage;
  final String posterPath;
  final String backdropPath;

  const MovieDetailEntity(
      {required this.id,
      required this.title,
      required this.releaseDate,
      required this.overview,
      required this.voteAverage,
      required this.posterPath,
      required this.backdropPath});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
