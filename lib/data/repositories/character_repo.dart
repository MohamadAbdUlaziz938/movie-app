import 'package:movie/data/model/character.dart';
import 'package:movie/data/services/charcter_service.dart';

class CharacterRepo {
  final CharacterService characterService;
  CharacterRepo({required this.characterService});
  Future<List<Character>> getAllCharacters() async {
    final List data = await characterService.getAllCharacters();
    return data.map((e) => Character.fromJson(e)).toList();
  }
}
