import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

part 'moviebackdrop_event.dart';
part 'moviebackdrop_state.dart';

class MoviebackdropBloc extends Bloc<MoviebackdropEvent, MoviebackdropState> {
  MoviebackdropBloc() : super(MoviebackdropInitial()) {
    on<MoviebackdropEvent>((event, emit) {
      if (event is MovieBackdropChangedEvent) {
        emit(MoviebackdropChanged(movie: (event).movie));
      }
    });
  }
}
