import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_lesson/dependency_injection/app_component.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
    : super(HomeState(isPending: false, characters: [], errorMessage: null));

  final GetCharactersUseCase _getCharactersUseCase = getIt
      .get<GetCharactersUseCase>();

  getCharacters() async {
    try {
      final response = await _getCharactersUseCase.execute();
      state.characters = response.results;
      emit(state.copyWith(characters: state.characters));
    } catch (e) {
      inspect(e);
    }
  }
}
