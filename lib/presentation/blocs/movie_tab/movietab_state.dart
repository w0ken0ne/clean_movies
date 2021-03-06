part of 'movietab_bloc.dart';

abstract class MovieTabState extends Equatable {
  final int currentTabIndex;

  const MovieTabState({this.currentTabIndex = 0});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabbedInitial extends MovieTabState {}

class MovieTabChanged extends MovieTabState {
  final List<MovieEntity?> movies;

  const MovieTabChanged({int currentTabIndex = 0, required this.movies})
      : super(currentTabIndex: currentTabIndex);

  @override
  List<Object> get props => [currentTabIndex, movies];
}

class MovieTabLoadError extends MovieTabState {
  final AppErrorType errorType;
  const MovieTabLoadError({required this.errorType, int currentTabIndex = 0})
      : super(currentTabIndex: currentTabIndex);
}

class MovieTabLoading extends MovieTabState {
  const MovieTabLoading({int currentTabIndex = 0})
      : super(currentTabIndex: currentTabIndex);
}
