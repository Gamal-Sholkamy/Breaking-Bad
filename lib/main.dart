import 'package:breaking_bad/business-logic/appBar_cubit/app_bar_cubit.dart';
import 'package:breaking_bad/business-logic/characters_cubit/characters_cubit.dart';
import 'package:breaking_bad/presentation/screens/home/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context)=>AppBarCubit()),
      BlocProvider(create: (BuildContext context)=>CharactersCubit()..getAllCharacters()),
    ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CharactersScreen(),
        ),
    );
  }
}


