import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastInitial()) {
    on<CastEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
