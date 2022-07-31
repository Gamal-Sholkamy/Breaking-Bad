import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class BuildCharacterInfo extends StatelessWidget{
  final String title;
  final String value;
  const BuildCharacterInfo(this.title,this.value);
  @override
  Widget build(BuildContext context) {
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
}