import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_application/feature/presentation/controllers/shop_cubit/shop_states.dart';
import '../../../data/data_source/shop_data_source/categories_data_source.dart';
import '../../../data/data_source/shop_data_source/favorite_data_source.dart';
import '../../../data/data_source/shop_data_source/home_data_source.dart';
import '../../../data/models/shop_models/categories_model.dart';
import '../../../data/models/shop_models/favorite_model.dart';
import '../../../data/models/shop_models/home_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  /// change bottom nav index

  int currentIndex = 0;

  void changeBottomNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavState());
  }

  /// get home data
  HomeModel? homeModel;

  void getHomeData() async {
    await HomeDataSource.getHomeData().then((value) {
      homeModel = HomeModel.fromJson(value.data);
      if (homeModel!.status == true) {
        print(homeModel!.banners[1].image);
        emit(HomeSuccessState());
      } else {
        emit(HomeErrorState('Status is false'));
      }
    }).catchError((error) {
      emit(HomeErrorState(error.toString()));
    });
  }

  /// get categories data
  CategoriesModel? categoriesModel;

  void getCategoriesData() async {
    await CategoriesDataSource.getCategoriesData().then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      if (categoriesModel!.status == true) {
        emit(CategoriesSuccessState());
      } else {
        emit(CategoriesErrorState('Status is false'));
      }
    }).catchError((error) {
      emit(CategoriesErrorState(error.toString()));
    });
  }

  /// add to favorite
  AddFavoriteModel? addFavoriteModel;

  void addToFavorite(int id) async {
    emit(AddToFavLoadingState());
    await FavoriteDataSource.addToFavorite({'product_id': id}).then((value) {
      addFavoriteModel = AddFavoriteModel.fromJson(value.data);
      if (addFavoriteModel!.status == true) {
        getFavorite();
        emit(AddToFavSuccessState());
      } else {
        emit(AddToFavErrorState('Add to favorite error'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(AddToFavErrorState(error.toString()));
    });
  }

  /// get favorite
  GetFavoriteModel? getFavoriteModel;

  void getFavorite() async {
    await FavoriteDataSource.getFavoriteList().then((value) {
      getFavoriteModel = GetFavoriteModel.fromJson(value.data);
      if (getFavoriteModel!.status == true) {
        emit(GetFavSuccessState());
      } else {
        emit(AddToFavErrorState('Add to favorite error'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetFavErrorState(error.toString()));
    });
  }

}
