import 'package:dio/dio.dart';

import '../../../../core/constants/constant.dart';
import '../../../../core/helper/dio_helper/dio_helper.dart';

class LoggedInData {
   Future<Response> loggedInUser(Map<String,dynamic>data) async {
      final response =await DioHelper.postData(
         url: AppConstants.loginEndPoint,
         data: data,
     );
      return response;
   }
  }
