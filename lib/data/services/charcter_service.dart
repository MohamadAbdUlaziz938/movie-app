import 'package:dio/dio.dart';
import 'package:movie/constants/strings.dart';

class CharacterService {
  late Dio dio;
  CharacterService() {
    BaseOptions options = BaseOptions(
      baseUrl: backendUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async {
    Response response = await dio.get('characters');
    print(response.data);
    return response.data;
  }
}
