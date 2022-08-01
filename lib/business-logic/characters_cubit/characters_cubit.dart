import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());

  static CharactersCubit get(context) => BlocProvider.of(context);
  CharactersAPI charactersAPI = CharactersAPI();
  List<CharacterModel> characters = [];
  List<CharacterModel> searchCharacters = [];
  List<CharacterModel> searchCharactersAll = [];

  List<CharacterModel> getAllCharacters() {
    emit(CharactersLoading());
    charactersAPI.getAllCharacters().then((value) {
      characters =
          value.map((character) => CharacterModel.fromJson(character)).toList();
      emit(CharactersLoaded(characters));
    }).catchError((onError) {
      emit(CharactersError(onError.toString()));
    });
    return characters;
  }

  // List<CharacterModel> searchForCharacter(String searchWord){
  //   searchCharacters=characters.where((character) =>character.name.toLowerCase().startsWith(searchWord) ).toList();
  //   emit(CharactersSearchForCharacter());
  //   return searchCharacters;
  //
  // }

  List<CharacterModel> searchForCharacter(String searchWord) {
    if (characters !=[]){
        searchCharacters=characters.where((character) =>character.name.toLowerCase().startsWith(searchWord) ).toList();
        emit(CharactersSearchingLoaded(searchCharacters));
        return searchCharacters;
    }
    else {
      charactersAPI.getAllCharacters().then((value) {
        searchCharactersAll =
            value.map((character) => CharacterModel.fromJson(character)).toList();
        searchCharacters = searchCharactersAll
            .where((character) =>
            character.name.toLowerCase().startsWith(searchWord))
            .toList();
        emit(CharactersSearchingLoaded(searchCharacters));
      }).catchError((onError) {
        emit(CharactersSearchingError(onError.toString()));
      });
      return searchCharacters;
    }

  }
}
