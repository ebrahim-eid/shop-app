import 'package:dio/dio.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/helper/cashe_helper/shared_prefernce.dart';
import '../../../../core/helper/dio_helper/dio_helper.dart';


class CategoriesDataSource{
  static Future <Response> getCategoriesData() async{
    final response =await DioHelper.getData(
        url: AppConstants.categoriesEndPoint,
        token: CashHelper.getData(key: 'token')
    );
    return response;
  }
}