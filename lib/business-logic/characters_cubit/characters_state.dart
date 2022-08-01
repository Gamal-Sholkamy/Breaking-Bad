part of 'characters_cubit.dart';
@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class CharactersLoading extends CharactersState {}
class CharactersLoaded extends CharactersState {
  List<CharacterModel>characters;
  CharactersLoaded(this.characters);
}
class CharactersError extends CharactersState {
  final String error;
  CharactersError(this.error);
}
class CharactersSearchingLoaded extends CharactersState {
  List<CharacterModel>characters;
  CharactersSearchingLoaded(this.characters);
}
class CharactersSearchingError extends CharactersState {
  final String error;
  CharactersSearchingError(this.error);
}

class CharactersChangeAppBarDesign extends CharactersState {}