import 'package:breaking_bad/business-logic/characters_cubit/characters_cubit.dart';
import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/shared/end_points.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatelessWidget {
   CharactersScreen({Key? key}) : super(key: key);
  final _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    return buildBlocBuilder();
  }
  Widget buildBlocBuilder(){
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        CharactersCubit charactersCubit = CharactersCubit.get(context);
        List<CharacterModel> characters = charactersCubit.characters;
        List<CharacterModel> searchedCharacters = [];
        bool isSearching=charactersCubit.isSearching;

        if (state is CharactersLoaded) {
          return Scaffold(
            appBar: buildAppBarDesign(isSearching,context),
            body:SingleChildScrollView(
              child: Container(
                // width: double.infinity,
                // height: double.infinity,
                color: myGray,
                child:Column(
                  children: [

                     buildListView(context),
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
      },
    );
  }
  Widget buildListView(context){
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
      itemBuilder: (context,index)=>buildCharacterItem(
        CharactersCubit.get(context).isSearching?
        CharactersCubit.get(context).searchCharacters[index]:CharactersCubit.get(context).characters[index]
      ),
      itemCount: CharactersCubit.get(context).isSearching?
      CharactersCubit.get(context).searchCharacters.length:CharactersCubit.get(context).characters.length,
    );
  }
  Widget buildCharacterItem(CharacterModel model){
    return InkWell(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        decoration: BoxDecoration(
          color: myWhite,
          borderRadius: BorderRadius.circular(8),

        ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(model.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  height: 1.3,fontSize: 16,color: myWhite,fontWeight: FontWeight.bold),),
          ),
          child:Container(
              color: myGray,
              child:model.image.isNotEmpty?
              FadeInImage.assetNetwork(
                  width: double.infinity,
                  height:double.infinity, fit: BoxFit.cover,
                  placeholder: 'assets/images/loading.gif', image: model.image):Image.asset("assets/images/1.jpg")
          ),
        ),
      ),
    );

  }
  PreferredSizeWidget buildAppBarDesign(bool isSearching,context){
    return AppBar(
        elevation: 0.0,
        backgroundColor: myYellow,
        leading: isSearching? IconButton(
            onPressed: (){
              CharactersCubit.get(context).changeAppBarDesign();
            },
            icon: const Icon(Icons.arrow_back,color: myGray,)
        ) :const SizedBox(width: 5,),
        title: isSearching? TextFormField(
          controller: _searchController,
          keyboardType: TextInputType.text,
          onChanged: (value){
            CharactersCubit.get(context).searchForCharacter(value);
          },
          decoration: const InputDecoration(
            hintText: "Search for Character..",
            hintStyle: TextStyle(color: Colors.black54,fontSize: 18),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.black54,fontSize: 18),
        ):const Text(
          "Characters", style: TextStyle(color: myGray,),),
        actions: [
          if(isSearching)
            IconButton(
                onPressed: (){
                  CharactersCubit.get(context).changeAppBarDesign();
                  _searchController.clear();
                },
                icon: const Icon(Icons.clear,color: myGray,)
            ),
          if(!isSearching)
            IconButton(
                onPressed: (){
                  CharactersCubit.get(context).changeAppBarDesign();
                },
                icon: const Icon(Icons.search,color: myGray,)
            ),
          const SizedBox(width: 10,)
        ],
      );



  }

}