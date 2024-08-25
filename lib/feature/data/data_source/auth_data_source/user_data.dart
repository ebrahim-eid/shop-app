import 'package:dio/dio.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/helper/dio_helper/dio_helper.dart';

class UserDataSource{
 static Future<Response> getUserData(String token) async {
    final response =await DioHelper.getData(
        url: AppConstants.profileEndPoint,
        token: token
    );
    return response;
  }
}