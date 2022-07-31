import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_bar_state.dart';

class AppBarCubit extends Cubit<AppBarState> {
  AppBarCubit() : super(AppBarInitial());
  static AppBarCubit get(context)=>BlocProvider.of(context);
  bool isSearching=false;
  void changeAppBarDesign(){
    isSearching=!isSearching;
    emit(CharactersChangeAppBarDesign());

  }
}
