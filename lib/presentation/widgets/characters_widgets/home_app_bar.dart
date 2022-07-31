import 'package:breaking_bad/business-logic/appBar_cubit/app_bar_cubit.dart';
import 'package:breaking_bad/business-logic/characters_cubit/characters_cubit.dart';
import 'package:breaking_bad/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar(bool isSearching, {Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarCubit, AppBarState>(
      builder: (context, state) {
        return AppBar(
          elevation: 0.0,
          backgroundColor: myYellow,
          leading: AppBarCubit.get(context).isSearching
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
          title: AppBarCubit.get(context).isSearching
              ? Container(
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
            if (AppBarCubit.get(context).isSearching)
              IconButton(
                  onPressed: () {
                    AppBarCubit.get(context).changeAppBarDesign();
                    _searchController.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: myGray,
                  )),
            if (!AppBarCubit.get(context).isSearching)
              IconButton(
                  onPressed: () {
                    AppBarCubit.get(context).changeAppBarDesign();
                  },
                  icon: const Icon(
                    Icons.search,
                    color: myGray,
                  )),
            const SizedBox(
              width: 10,
            )
          ],
        );
      },
    );
  }
}
