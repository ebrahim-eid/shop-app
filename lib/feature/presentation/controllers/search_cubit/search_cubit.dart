import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/data_source/shop_data_source/search_data_source.dart';
import '../../../data/models/shop_models/search_model.dart';
import 'search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  /// search
  SearchModel? searchModel;

  void searchProduct(String text) async {
    emit(SearchLoadingState());
    await SearchDataSource.searchData({'text': text}).then((value) {
      if (value.data['status'] == true) {
        searchModel = SearchModel.fromJson(value.data);
        emit(SearchSuccessState());
      } else {
        emit(SearchErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}