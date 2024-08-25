import 'package:dio/dio.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/helper/cashe_helper/shared_prefernce.dart';
import '../../../../core/helper/dio_helper/dio_helper.dart';

class HomeDataSource{
 static Future <Response> getHomeData() async{
    final response =await DioHelper.getData(
        url: AppConstants.homeEndPoint,
      token: CashHelper.getData(key: 'token')
    );
    return response;
  }
}