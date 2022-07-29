import 'package:breaking_bad/data/api/characters_api.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : super(CharactersInitial());
 static CharactersCubit get(context)=>BlocProvider.of(context);
  CharactersAPI charactersAPI=CharactersAPI();
  bool isSearching=false;
  List<CharacterModel> characters=[];
  List<CharacterModel> searchCharacters=[];
  List<CharacterModel>getAllCharacters(){
    emit(CharactersLoading());
    charactersAPI.getAllCharacters().then((value){
      characters=value.map((character) =>CharacterModel.fromJson(character)).toList();
      emit(CharactersLoaded(characters));

    } ).catchError((onError){
      emit(CharactersError(onError.toString()));

    });
    return characters;
  }
  List<CharacterModel> searchForCharacter(String searchWord){
    searchCharacters=characters.where((character) =>character.name.toLowerCase().startsWith(searchWord) ).toList();
    emit(CharactersSearchForCharacter());
    return searchCharacters;
  }
  void changeAppBarDesign(){
    isSearching=!isSearching;
    emit(CharactersChangeAppBarDesign());

  }


}
