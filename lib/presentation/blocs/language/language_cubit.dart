import 'package:bloc/bloc.dart';
import 'package:clean_movies/common/constants/languages.dart';
import 'package:clean_movies/domain/entities/language_entity.dart';
import 'package:clean_movies/domain/usecases/get_preferred_language.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:clean_movies/domain/usecases/update_language.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<Locale> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;

  LanguageCubit(
      {required this.getPreferredLanguage, required this.updateLanguage})
      : super(Locale(Languages.languages[0].code));

  void toggleLanguage(LanguageEntity language) async {
    await updateLanguage(language.code);
    loadPreferredLanguage();
  }

  void loadPreferredLanguage() async {
    final response = await getPreferredLanguage(NoParams());
    emit(response.fold(
        (l) => Locale(Languages.languages[0].code), (r) => Locale(r)));
  }
}
