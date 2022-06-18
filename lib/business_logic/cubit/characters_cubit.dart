import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/data/model/character.dart';
import 'package:movie/data/repositories/character_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepo characterRepo;
  late List<Character> characters;
  CharactersCubit({required this.characterRepo}) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    characterRepo.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
