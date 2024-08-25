import 'package:dio/dio.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/helper/cashe_helper/shared_prefernce.dart';
import '../../../../core/helper/dio_helper/dio_helper.dart';

class FavoriteDataSource{
  /// add to favorite
  static Future<Response> addToFavorite(Map<String,dynamic>data) async {
    final response =await DioHelper.postData(
        url: AppConstants.favoriteEndPoint,
        data: data,
        token: CashHelper.getData(key: 'token'),
    );
    return response;
  }

  /// get favorite list
  static Future<Response> getFavoriteList() async {
    final response =await DioHelper.getData(
      url: AppConstants.favoriteEndPoint,
      token: CashHelper.getData(key: 'token'),
    );
    return response;
  }

}