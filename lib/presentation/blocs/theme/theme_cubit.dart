import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

enum Themes {
  light,
  dark,
}

class ThemeCubit extends Cubit<ThemeState> {
  final GetPreferredTheme getPreferredTheme;
  final UpdatePreferredTheme updatePreferredTheme;
  ThemeCubit(
      {required this.getPreferredTheme, required this.updatePreferredTheme})
      : super(ThemeInitial());

  Future<void> toggleTheme() async {
    await updatePreferredTheme(state == Themes.dark ? 'light' : 'dark');
    loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final response = await getPreferredTheme(NoParams());
    emit(response.fold(
      (failure) => Themes.dark,
      (theme) => theme == 'dark' ? Themes.dark : Themes.light,
    ));
  }
}
