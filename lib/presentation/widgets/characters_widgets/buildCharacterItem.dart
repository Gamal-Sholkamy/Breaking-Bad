import 'package:flutter/material.dart';

import '../../../data/models/character_model.dart';
import '../../../shared/constants.dart';
import '../../screens/character_details/character_details_screen.dart';

class BuildCharacterItem extends StatelessWidget{
  final CharacterModel model;
  final BuildContext context;
  BuildCharacterItem(this.model,this.context);
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
      decoration: BoxDecoration(
        color: myWhite,
        borderRadius: BorderRadius.circular(8),

      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CharacterDetailsScreen(model)));
        },
        child: Hero(
          tag: model.charId,
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
      ),

    );

  }
}