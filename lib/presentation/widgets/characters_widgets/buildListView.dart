import 'package:breaking_bad/business-logic/appBar_cubit/app_bar_cubit.dart';
import 'package:breaking_bad/presentation/widgets/characters_widgets/buildCharacterItem.dart';
import 'package:flutter/material.dart';

import '../../../business-logic/characters_cubit/characters_cubit.dart';

class BuildListView extends StatelessWidget{
  final BuildContext context;
  BuildListView(this.context);
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
      itemBuilder: (context,index)=>BuildCharacterItem(
          AppBarCubit.get(context).isSearching?
          CharactersCubit.get(context).searchCharacters[index]:CharactersCubit.get(context).characters[index]
          ,context
      ),
      itemCount: AppBarCubit.get(context).isSearching?
      CharactersCubit.get(context).searchCharacters.length:CharactersCubit.get(context).characters.length,
    );
  }
}