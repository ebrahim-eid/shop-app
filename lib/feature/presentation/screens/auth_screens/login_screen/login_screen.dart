import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helper/cashe_helper/shared_prefernce.dart';
import '../../../../../core/helper/helper_functions/helper_functions.dart';
import '../../../../../core/reuable_widgets/reusable_widgets.dart';
import '../../../controllers/auth_cubit/auth_cubit.dart';
import '../../../controllers/auth_cubit/auth_states.dart';
import '../../../widgets/auth_widgets/auth_main_widget.dart';
import '../../shop_screens/home_screen.dart';
import '../register_screen/register_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
   var formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginLoadingState){
          showDialog(
              context: context,
              builder: (context)=>const Center(child:  CircularProgressIndicator(strokeWidth: 8,))
          );
        }else if(state is LoginErrorState){
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: snakeBar(message: state.error.toString(), icon: Icons.error_outline),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ));

        }else if(state is LoginSuccessState){
          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
            content: snakeBar(message: state.message.toString(), icon: Icons.check_box),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ));
          Navigator.pop(context);
          CashHelper.setData(key: 'token', value: AuthCubit.get(context).token).then((value){
            HelperFunctions.navigateAndRemove(context,  HomeScreen());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: authMainWidget(context,
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            isLogin: true,
            buttonPress1: () {
            if(formKey.currentState!.validate()){
              AuthCubit.get(context).loggedInUser(
                  email: emailController.text,
                  password: passwordController.text
              );
            }
            },
            buttonPress2: () { HelperFunctions.navigateAndRemove(context, RegisterScreen()); },
          ),

        );
      },
    );
  }
}