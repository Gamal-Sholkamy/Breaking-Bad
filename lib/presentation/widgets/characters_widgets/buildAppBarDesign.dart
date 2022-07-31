import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business-logic/appBar_cubit/app_bar_cubit.dart';
import '../../../business-logic/characters_cubit/characters_cubit.dart';
import '../../../shared/constants.dart';

class BuildAppBarDesign extends StatelessWidget{
  final bool isSearching;
  final BuildContext context;
  final _searchController=TextEditingController();
  BuildAppBarDesign(this.isSearching,this.context);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: myYellow,
      leading: isSearching
          ? IconButton(
              onPressed: () {
                AppBarCubit.get(context).changeAppBarDesign();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: myGray,
              ))
          : const SizedBox(
              width: 5,
            ),
    title: isSearching? Container(
              width: 200,
              child: TextFormField(
                controller: _searchController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  CharactersCubit.get(context).searchForCharacter(value);
                },
                decoration: const InputDecoration(
                  hintText: "Search for Character..",
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 18),
                  border: InputBorder.none,
                ),
                style: const TextStyle(color: Colors.black54, fontSize: 18),
              ),
            )
          : const Text(
              "Characters",
              style: TextStyle(
                color: myGray,
              ),
            ),
        actions: [
                  if(isSearching)
                    IconButton(
                        onPressed: (){
                          AppBarCubit.get(context).changeAppBarDesign();
                          _searchController.clear();
                        },
                        icon: const Icon(Icons.clear,color: myGray,)
                    ),
                  if(!isSearching)
                    IconButton(
                        onPressed: (){
                          AppBarCubit.get(context).changeAppBarDesign();
                        },
                        icon: const Icon(Icons.search,color: myGray,)
                    ),
                  const SizedBox(width: 10,)
                ],

    );



  }

}