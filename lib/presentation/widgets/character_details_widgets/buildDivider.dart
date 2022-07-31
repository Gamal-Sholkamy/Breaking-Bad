import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class BuildDivider extends StatelessWidget{
  final double endIndent;
  const BuildDivider(this.endIndent);
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: myYellow,
      height: 30,
      endIndent:endIndent,
      thickness: 2,);

  }

}