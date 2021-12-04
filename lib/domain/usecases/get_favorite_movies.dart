import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetFavoriteMovies({required this.repository});
  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await repository.getFavoriteMovies();
  }
}
