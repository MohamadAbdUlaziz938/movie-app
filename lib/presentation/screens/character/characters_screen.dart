import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/business_logic/cubit/characters_cubit.dart';
import 'package:movie/constants/colors.dart';
import 'package:movie/data/model/character.dart';
import 'package:movie/presentation/screens/character/widgets/character_item.dart';
import 'package:movie/presentation/screens/character/widgets/character_item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late  List<Character> characters;
  late  List<Character> searchedCharacters;
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  buildSearchField() {
    return TextField(
      controller: searchController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
          hintText: "Find a character",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 18)),
      style: TextStyle(color: Colors.grey, fontSize: 18),
      onChanged: (char) {
        buildSearchedCharacters(char);
      },
    );
  }

  void buildSearchedCharacters(String txt) {
    searchedCharacters = characters
        .where((element) =>
            element.name.toLowerCase().contains(txt.toLowerCase().trim()))
        .toList();
    setState(() {});
  }

  void startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void clearSearch() {
    searchController.clear();
  }

  List<Widget> buildAppBarAction() {
    if (isSearching) {
      return [
        IconButton(
            onPressed: () {
              searchController.clear();
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.clear,
              color: Colors.grey,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: () {
              startSearching();
            },
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ))
      ];
    }
  }
  buildAppBarTitle(){
    return const Text(
      'characters',
      style: TextStyle(color: Colors.grey),
    );
  }
  buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          characters = state.characters;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200),
            itemBuilder: (context, index) {
              return CharacterItem(
                character: state.characters[index],
              );
            },
            itemCount: searchController.text.isEmpty?state.characters.length:searchedCharacters.length,
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: isSearching?BackButton(color: Colors.grey,):SizedBox(),
        backgroundColor: MyColor.yallow,
        title: isSearching?buildSearchField():buildAppBarTitle(),
        actions: buildAppBarAction(),
      ),
      body: buildBlocWidget(),
    );
  }
}
