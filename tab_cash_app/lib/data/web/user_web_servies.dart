import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tab_cash_app/constants/strings.dart';

class UserWebServies {
  late Dio dio;
  UserWebServies() {
    BaseOptions options = BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getUserById() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userIdShared = sharedPref.getString('userId');
    try {
      String getTry = '${AppEndPoints.usersIdUrl}$userIdShared';
      Response response = await dio.get(getTry);
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return {};
    }
  }

  Future<int> getUserByPhone(String phoneNumber) async {
    try {
      String getTry = '${AppEndPoints.usersPhoneUrl}$phoneNumber';
      Response response = await Dio().get(getTry);
      return response.statusCode!;
    } catch (e) {
      print('error');
      return 1;
    }
  }
}
