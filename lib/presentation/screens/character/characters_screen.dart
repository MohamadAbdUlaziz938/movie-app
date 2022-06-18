import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/business_logic/cubit/characters_cubit.dart';
import 'package:movie/data/model/character.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> characters;
  @override
  void initState() {
    super.initState();
    characters = BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          characters = state.characters;
          return Text('data');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'characters',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
