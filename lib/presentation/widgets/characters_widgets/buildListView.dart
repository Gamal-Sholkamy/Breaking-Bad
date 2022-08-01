import 'package:breaking_bad/business-logic/appBar_cubit/app_bar_cubit.dart';
import 'package:breaking_bad/presentation/widgets/characters_widgets/buildCharacterItem.dart';
import 'package:breaking_bad/presentation/widgets/characters_widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../business-logic/characters_cubit/characters_cubit.dart';

class CharactersListView extends StatelessWidget{
  const CharactersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
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
}