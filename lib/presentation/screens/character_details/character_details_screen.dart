import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/shared/end_points.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel model;

  CharacterDetailsScreen(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildCharacterInfo('Job : ',model.occupation.join(' / ')),
                      buildDivider(270),
                      buildCharacterInfo('Appeared in : ',model.category),
                      buildDivider(210),
                      buildCharacterInfo('Seasons : ',model.appearance.join(' / ')),
                      buildDivider(200),
                      buildCharacterInfo('Status : ',model.status),
                      buildDivider(210),
                      if(model.betterCallSaulAppearance.isNotEmpty)
                      buildCharacterInfo('Better Call Saul Seasons : ',model.betterCallSaulAppearance.join(' / ')),
                      if(model.betterCallSaulAppearance.isNotEmpty)
                      buildDivider(150),
                      buildCharacterInfo('Actor/Actress : ',model.name),
                      buildDivider(200),
                      const SizedBox(height: 15,)

                    ],
                  ),
                ),
                const SizedBox(height: 400,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: myGray,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          model.nickName,
          style: const TextStyle(color: myWhite),
        ),
        background: Hero(
          tag: model.charId,
          child: Image.network(
            model.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget buildCharacterInfo(String title, String value) {
    return RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: title,style: const TextStyle(color: myWhite,fontWeight: FontWeight.bold,fontSize: 18)
            ),
            TextSpan(
                text: value,style: const TextStyle(color: myWhite,fontWeight: FontWeight.normal,fontSize: 16)
            ),
          ]
        ));
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: myYellow,
      height: 30,
    endIndent:endIndent,
    thickness: 2,);
  }
}
