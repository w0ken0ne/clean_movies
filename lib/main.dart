import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'data/repositories/movie_repository_impl.dart';
import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/usecases/get_trending.dart';

Future<void> main() async {
  //1 - Iniciando a ApiClient
  ApiClient client = ApiClient(Client());
  //2 - Instanciando o datasource e passando a instancia do cliente
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(client);
  //3 - Instanciando o repository e passando a instancia do datasource
  MovieRepository repository = MovieRepositoryImpl(dataSource);
  //4 - Instanciando o usecase e passando o repository
  GetTrending getTrending = GetTrending(repository);
  //5 - Executando o usecase
  //getTrending();
  //6 - Folding o result do either no usecase
  final Either<AppError, List<MovieEntity?>> eitherResponse =
      await getTrending();
  eitherResponse.fold(
    (l) {
      print("Deu erro meo");
      print(l.message);
    },
    (r) {
      print("Deu bom meo");
      print(r);
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
