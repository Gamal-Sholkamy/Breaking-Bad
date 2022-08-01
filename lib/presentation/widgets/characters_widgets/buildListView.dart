import 'package:breaking_bad/business-logic/appBar_cubit/app_bar_cubit.dart';
import 'package:breaking_bad/presentation/widgets/characters_widgets/buildCharacterItem.dart';
import 'package:breaking_bad/presentation/widgets/characters_widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business-logic/characters_cubit/characters_cubit.dart';
import '../../../data/models/character_model.dart';
import '../../../shared/constants.dart';

class CharactersListView extends StatelessWidget{
  const CharactersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CharactersCubit,CharactersState>
      (builder: (context,state){
      CharactersCubit charactersCubit = CharactersCubit.get(context);
      List<CharacterModel> characters = charactersCubit.characters;
      List<CharacterModel> searchedCharacters = charactersCubit.searchCharacters;
      bool isSearching=AppBarCubit.get(context).isSearching;
      if (state is CharactersLoaded || state is CharactersSearchingLoaded) {
        return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemBuilder: (context,index)=>CharacterItemDesign(
          AppBarCubit.get(context).isSearching?
          CharactersCubit.get(context).searchCharacters[index]:CharactersCubit.get(context).characters[index]
          ,
        ),
        itemCount: AppBarCubit.get(context).isSearching?
        CharactersCubit.get(context).searchCharacters.length:CharactersCubit.get(context).characters.length,
      );
      }
      else {
        return Scaffold(
          appBar: AppBar(backgroundColor: myYellow,),
        );
      }
    });
  }
}