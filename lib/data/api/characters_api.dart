import 'package:breaking_bad/shared/end_points.dart';
import 'package:dio/dio.dart';

class CharactersAPI{
  late Dio dio;
  CharactersAPI(){
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20*1000,
      connectTimeout: 20*1000,
    );
    dio=Dio(options);
  }
  Future<List<dynamic>> getAllCharacters()async{
    Response response=await dio.get('characters');
    return response.data;
  }
}