import 'package:dio/dio.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/helper/cashe_helper/shared_prefernce.dart';
import '../../../../core/helper/dio_helper/dio_helper.dart';

class SearchDataSource {
  static Future<Response> searchData(Map<String, dynamic> data) async {
    final response = await DioHelper.postData(
      url: AppConstants.searchEndPoint,
      data: data,
      token: CashHelper.getData(key: 'token'),
    );
    return response;
  }
}
