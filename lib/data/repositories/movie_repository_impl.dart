import 'dart:io';

import 'package:clean_movies/data/datasources/movie_local_data_source.dart';
import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_movies/data/tables/movie_table.dart';
import 'package:clean_movies/domain/entities/cast_entity.dart';
import 'package:clean_movies/domain/entities/movie_detail_entity.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/video_entity.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDataSource localDataSource;
  MovieRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<AppError, List<MovieEntity?>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return right(movies);
    } on SocketException {
      return left(const AppError(AppErrorType.network));
    } on Exception {
      return left(const AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity?>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return right(movies);
    } on SocketException {
      return left(const AppError(AppErrorType.network));
    } on Exception {
      return left(const AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity?>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return right(movies);
    } on SocketException {
      return left(const AppError(AppErrorType.network));
    } on Exception {
      return left(const AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity?>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return right(movies);
    } on SocketException {
      return left(const AppError(AppErrorType.network));
    } on Exception {
      return left(const AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailEntity?>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return right(movie);
    } on SocketException {
      return left(const AppError(AppErrorType.network));
    } on Exception {
      return left(const AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<CastEntity?>>> getCastCrew(int id) async {
    try {
      final cast = await remoteDataSource.getCastCrew(id);
      return Right(cast);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<VideoEntity?>>> getVideos(int id) async {
    try {
      final videos = await remoteDataSource.getVideos(id);
      return Right(videos);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity?>>> getSearchedMovies(
      String searchTerm) async {
    try {
      final movies = await remoteDataSource.getSearchedMovies(searchTerm);
      return Right(movies);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      return const Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId) async {
    try {
      final favorite = await localDataSource.checkIfMovieFavorite(movieId);
      return Right(favorite);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId) async {
    try {
      final response = await localDataSource.deleteMovie(movieId);
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies() async {
    try {
      final response = await localDataSource.getMovies();
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async {
    try {
      final response = await localDataSource
          .saveMovie(MovieTable.fromMovieEntity(movieEntity));
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.database));
    }
  }
}
