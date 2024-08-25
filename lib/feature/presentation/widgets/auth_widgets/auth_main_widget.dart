import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/helper/helper_functions/helper_functions.dart';
import '../../../../core/reuable_widgets/reusable_widgets.dart';
import '../../controllers/auth_cubit/auth_cubit.dart';

Widget authMainWidget(context,{
  required GlobalKey formKey,
  required TextEditingController emailController,
  required TextEditingController passwordController,
   TextEditingController? nameController,
   TextEditingController? phoneController,
  required bool isLogin,
  required VoidCallback buttonPress1,
  required GestureTapCallback buttonPress2,
  bool loginState=false,
  bool registerState=false,
}){

  return Center(
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 0,
          child: Container(
            width: HelperFunctions.getScreenWidth(context),
            height: HelperFunctions.getScreenHeight(context) * 0.21,
            color: AppColors.defaultColor,
            child: Center(
                child: Image(
                  image: AssetImage(isLogin ==true ?ImagesPath.loginImage:ImagesPath.registerImage),
                  width: 80,
                  height: 80,
                  color: Colors.white,
                )),
          ),
        ),
        Positioned(
          bottom: 120,
          child: Container(
            padding: const EdgeInsets.all(20),
            width: HelperFunctions.getScreenWidth(context) * 0.9,
            height: HelperFunctions.getScreenHeight(context) * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.grey, blurRadius: 5),
                BoxShadow(color: Colors.grey, blurRadius: 5),
                BoxShadow(color: Colors.grey, blurRadius: 5),
                BoxShadow(color: Colors.grey, blurRadius: 5),
              ],
              color: Colors.white,
            ),
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLogin ==true ?'SIGN IN':'SIGN UP',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isLogin == false)...{
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(context,
                            controller: nameController!,
                            type: TextInputType.text,
                            validateMessage: 'Name must not be empty',
                            hint: 'Your Name',
                            prefixIcon: Icons.person_outline),
                        const SizedBox(
                          height: 29.9,
                        ),
                        defaultFormField(context,
                            controller: phoneController!,
                            type: TextInputType.phone,
                            validateMessage: 'Phone must not be empty',
                            hint: 'Your Phone Number',
                            prefixIcon: Icons.phone),
                      },

                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(context,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validateMessage: 'Email address must not be empty',
                          hint: 'Email',
                          prefixIcon: Icons.email_outlined),
                      const SizedBox(
                        height: 20,
                      ),
                      defaultFormField(context,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validateMessage: 'Password must not be empty',
                          hint: 'Password',
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: AuthCubit.get(context).isVisible ?Icons.visibility:Icons.visibility_off,
                          isSecure: AuthCubit.get(context).isVisible
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      defaultButton(isLogin ==true ?'SIGN IN':'SIGN UP', buttonPress1),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLogin ==true ?'Don\'t have an account? ':'Already have an account? ',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: buttonPress2,
                            child: Text(
                              isLogin ==false ?'SIGN IN':'SIGN UP',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.defaultColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
