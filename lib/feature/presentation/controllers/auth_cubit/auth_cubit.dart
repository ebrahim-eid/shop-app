import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper/cashe_helper/shared_prefernce.dart';
import '../../../data/data_source/auth_data_source/login_data.dart';
import '../../../data/data_source/auth_data_source/register_data.dart';
import '../../../data/data_source/auth_data_source/update_user_date.dart';
import '../../../data/data_source/auth_data_source/user_data.dart';
import '../../../data/models/user_model/user_model.dart';
import 'auth_states.dart';


class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  /// change icon visibility
  bool isVisible = true;
  void changeIconVisibility() {
    isVisible = !isVisible;
    emit(ChangeIconVisibilityState());
  }

  String ? token;
  /// login
  Future loggedInUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      await LoggedInData().loggedInUser({'email': email, 'password': password}).then((value){
        if (value.data['data'] != null){
          token=value.data['data']['token'];
          getUserData();
          emit(LoginSuccessState(value.data['message']));
        }else{
          emit(LoginErrorState(value.data['message']));
        }
      });
    } catch (error) {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    }
  }

/// Register
Future registerUser({
  required String name,
  required String phone,
  required String email,
  required String password,
}) async {
    emit(RegisterLoadingState());
    try {
      await RegisterData.userRegister(
          {
            'name':name,
            'phone':phone,
            'email': email,
            'password': password,
          }
      ).then((value){
        if (value.data['data'] != null){
          token=value.data['data']['token'];
          getUserData();
          emit(RegisterSuccessState(value.data['message']));
        }else{
          print(value.data['message']);
          emit(RegisterErrorState(value.data['message']));
        }
      });
    } catch (error) {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    }
}

/// user data
  UserModel ?userModel;
 Future<void> getUserData()async {
  if(CashHelper.getData(key: 'token') !=null){
    emit(UserDataLoadingState());
    await UserDataSource.getUserData(CashHelper.getData(key: 'token')).then((value){
      userModel =UserModel.fromJson(value.data);
      if(userModel!.status==true){
        emit(UserDataSuccessState());
      }else{
        emit(UserDataErrorState('False Status'));
      }
    }).catchError((error){
      print(error.toString());
      emit(UserDataErrorState(error.toString()));
    });
  }else{
    if(this.token !=null){
      emit(UserDataLoadingState());
      await UserDataSource.getUserData(this.token!).then((value){
        userModel =UserModel.fromJson(value.data);
        if(userModel!.status==true){
          emit(UserDataSuccessState());
        }else{
          emit(UserDataErrorState('False Status'));
        }
      }).catchError((error){
        print(error.toString());
        emit(UserDataErrorState(error.toString()));
      });

    }
  }
 }

  /// update user data
  Future updateUserDta({
    required String name,
    required String phone,
    required String email,
  }) async {
    emit(UpdateUserDataLoadingState());
    try {
      await UpdateUserDataSource.updateUserData(
          {
            'name':name,
            'phone':phone,
            'email': email,
          }
      ).then((value){
        if (value.data['status'] == true){
          getUserData();
          emit(UpdateUserDataSuccessState(value.data['message']));
        }else{
          print(value.data['message']);
          emit(UpdateUserDataErrorState(value.data['message']));
        }
      });
    } catch (error) {
      print(error.toString());
      emit(UpdateUserDataErrorState(error.toString()));
    }
  }
}