import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/business_logic/cubit/characters_cubit.dart';
import 'package:movie/constants/strings.dart';
import 'package:movie/data/repositories/character_repo.dart';
import 'package:movie/data/services/charcter_service.dart';
import 'package:movie/presentation/screens/character/characters_screen.dart';

class AppRouter {
  late CharacterRepo characterRepo;
  AppRouter() {
    characterRepo = CharacterRepo(characterService: CharacterService());
  }
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => CharactersCubit(characterRepo: characterRepo),
            child: const CharacterScreen(),
          ),
        );
    }
  }
}
