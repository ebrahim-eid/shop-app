import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/helper/cashe_helper/shared_prefernce.dart';
import 'core/helper/dio_helper/dio_helper.dart';
import 'feature/presentation/controllers/auth_cubit/auth_cubit.dart';
import 'feature/presentation/controllers/bloc_observer.dart';
import 'feature/presentation/controllers/onboarding_cubit/on_boarding_cubit.dart';
import 'feature/presentation/controllers/shop_cubit/shop_cubit.dart';
import 'feature/presentation/screens/auth_screens/login_screen/login_screen.dart';
import 'feature/presentation/screens/onboarding_screen/on_boarding_screen.dart';
import 'feature/presentation/screens/shop_screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  dynamic onboarding = CashHelper.getData(key: 'onboarding');
  dynamic token = CashHelper.getData(key: 'token');
  runApp( MyApp(onboarding: onboarding,token: token,));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
   const MyApp({super.key, this.onboarding, this.token});
 final dynamic onboarding;
 final dynamic token;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>OnBoardingCubit()),
        BlocProvider(create: (context)=>AuthCubit()..getUserData()),
        BlocProvider(create: (context)=>ShopCubit()..getHomeData()..getCategoriesData()..getFavorite()),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: onboarding ==null ? const OnBoardingScreen() : token==null? LoginScreen():HomeScreen(),
      ),
    );
  }
}