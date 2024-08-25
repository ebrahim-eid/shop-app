import 'package:dio/dio.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/helper/dio_helper/dio_helper.dart';

class RegisterData{
  static Future<Response> userRegister(Map<String,dynamic>data) async{
    final response = await DioHelper.postData(
        url: AppConstants.registerEndPoint,
        data: data,
    );
    return response;
  }
}