

import 'package:flutter/material.dart';

import '../../feature/presentation/controllers/auth_cubit/auth_cubit.dart';
import '../constants/colors.dart';

/// default form field

Widget defaultFormField(context,{
  required TextEditingController controller,
  required TextInputType type,
  required String validateMessage,
  required String hint,
  required IconData prefixIcon,
  ValueChanged<String>? onChanged,
  IconData ? suffixIcon,
  bool isSecure=false
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isSecure,
  style: const TextStyle(color: Colors.white),
  validator: (value){
    if (value!.isEmpty){
      return validateMessage;
    }
    return null;
  },
  onChanged: onChanged,
  decoration: InputDecoration(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none
    ),
    filled: true,
    fillColor: AppColors.defaultColor,
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.white),
    prefixIcon: Icon(prefixIcon,color: Colors.white,),
    suffixIcon: suffixIcon != null ?IconButton(onPressed: (){AuthCubit.get(context).changeIconVisibility();}, icon: Icon(suffixIcon,color: Colors.white,)):null,
    contentPadding: const EdgeInsets.all(18),
  ),
);

/// default button

Widget defaultButton(String text,VoidCallback onPressed)=> ElevatedButton(
  onPressed: onPressed,
  style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.defaultColor),
      padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 20,vertical: 10)),
      fixedSize: const WidgetStatePropertyAll(Size(200,60))
  ),
  child:  Text(text,style: const TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20),),
);

Widget snakeBar({
  required String message,
  required IconData icon,
}){
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.defaultColor),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    ),
  );
}