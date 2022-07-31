import 'package:breaking_bad/business-logic/appBar_cubit/app_bar_cubit.dart';
import 'package:breaking_bad/business-logic/characters_cubit/characters_cubit.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/characters_widgets/buildListView.dart';

class CharactersScreen extends StatefulWidget {
   CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder:(context, state) {
        CharactersCubit charactersCubit = CharactersCubit.get(context);
        List<CharacterModel> characters = charactersCubit.characters;
        List<CharacterModel> searchedCharacters = [];
        bool isSearching=AppBarCubit.get(context).isSearching;
        if (state is CharactersLoaded) {
          return Scaffold(
            appBar: buildAppBarDesign(isSearching,context),
            body:SingleChildScrollView(
              child: Container(
                color: myGray,
                child:Column(
                  children: [
                    BuildListView(context),
                  ],
                ),
              ),
            ) ,

          );
        }
        else {
          return Scaffold(
            appBar: AppBar(backgroundColor: myYellow,),
          );
        }
      } ,
    );
  }

  // Widget buildListView(context){
  PreferredSizeWidget buildAppBarDesign(bool isSearching,context){
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