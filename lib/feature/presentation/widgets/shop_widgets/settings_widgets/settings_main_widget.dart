import 'package:flutter/material.dart';
import 'package:shop_application/feature/presentation/widgets/shop_widgets/settings_widgets/settings_reusable.dart';
import '../../../../../core/helper/cashe_helper/shared_prefernce.dart';
import '../../../../../core/helper/helper_functions/helper_functions.dart';
import '../../../../../core/reuable_widgets/reusable_widgets.dart';
import '../../../../data/models/user_model/user_model.dart';
import '../../../screens/auth_screens/login_screen/login_screen.dart';


Widget settingsMainWidget(context,UserModel model)=>Padding(
  padding: const EdgeInsets.all(20),
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        settingsReusableItems(itemName: 'Name', itemValue: model.data!.name, editTap: () {
          updateData(context, model,1);
        }),
        settingsReusableItems(itemName: 'Phone Number', itemValue: model.data!.phone, editTap: () {
          updateData(context, model,2);
        }),
        settingsReusableItems(itemName: 'Email Address', itemValue: model.data!.email, editTap: () {
          updateData(context, model,3);
        }),
        const SizedBox(height: 30,),
        defaultButton('Logout', (){
          CashHelper.clearData('token').then((value){
            HelperFunctions.navigateAndRemove(context, LoginScreen());
          });

        })
      ],
    ),
  ),
);