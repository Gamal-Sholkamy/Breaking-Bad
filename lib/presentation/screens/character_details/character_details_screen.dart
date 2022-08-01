import 'package:breaking_bad/data/models/character_model.dart';
import 'package:breaking_bad/shared/constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/character_details_widgets/buildCharacterInfo.dart';
import '../../widgets/character_details_widgets/buildDivider.dart';
import '../../widgets/character_details_widgets/buildSliverAppBar.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final CharacterModel model;

  const CharacterDetailsScreen(this.model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myGray,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppBar(model),
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
                      BuildCharacterInfo('Job : ',model.jobs.join(' / ')),
                      const BuildDivider(270),
                      BuildCharacterInfo('Appeared in : ',model.category),
                      const BuildDivider(215),
                      BuildCharacterInfo('Seasons : ',model.appearance.join(' / ')),
                      const BuildDivider(240),
                      BuildCharacterInfo('Status : ',model.status),
                      const BuildDivider(260),
                      if(model.betterCallSaulAppearance.isNotEmpty)
                      BuildCharacterInfo('Better Call Saul Seasons : ',model.betterCallSaulAppearance.join(' / ')),
                      if(model.betterCallSaulAppearance.isNotEmpty)
                      const BuildDivider(115),
                      BuildCharacterInfo('Actor/Actress : ',model.portrayed),
                      const BuildDivider(200),
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

  // Widget buildSliverAppBar() {
  //   return SliverAppBar(
  //     expandedHeight: 600,
  //     pinned: true,
  //     stretch: true,
  //     backgroundColor: myGray,
  //     flexibleSpace: FlexibleSpaceBar(
  //       centerTitle: true,
  //       title: Text(
  //         model.nickName,
  //         style: const TextStyle(color: myWhite),
  //       ),
  //       background: Hero(
  //         tag: model.charId,
  //         child: Image.network(
  //           model.image,
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget buildCharacterInfo(String title, String value) {
  //   return RichText(
  //       maxLines: 1,
  //       overflow: TextOverflow.ellipsis,
  //       text: TextSpan(
  //         children: [
  //           TextSpan(
  //             text: title,style: const TextStyle(color: myWhite,fontWeight: FontWeight.bold,fontSize: 18)
  //           ),
  //           TextSpan(
  //               text: value,style: const TextStyle(color: myWhite,fontWeight: FontWeight.normal,fontSize: 16)
  //           ),
  //         ]
  //       ));
  // }

  // Widget buildDivider(double endIndent) {
  //   return Divider(
  //     color: myYellow,
  //     height: 30,
  //   endIndent:endIndent,
  //   thickness: 2,);
  // }
}
