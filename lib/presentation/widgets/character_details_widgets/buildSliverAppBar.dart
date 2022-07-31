import 'package:breaking_bad/data/models/character_model.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class BuildSliverAppBar extends StatelessWidget{
  final CharacterModel model;
  BuildSliverAppBar(this.model);
  @override
  Widget build(BuildContext context) {
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
}