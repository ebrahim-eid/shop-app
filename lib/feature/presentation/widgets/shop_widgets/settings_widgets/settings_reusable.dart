import 'package:flutter/material.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../data/models/user_model/user_model.dart';
import '../../../controllers/auth_cubit/auth_cubit.dart';

Widget settingsReusableItems({
  required String itemName,
  required String itemValue,
  required GestureTapCallback editTap,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            itemName,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.defaultColor),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemValue,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.defaultColor),
                ),
                InkWell(
                  onTap: editTap,
                  child:
                      Icon(Icons.edit, size: 30, color: AppColors.defaultColor),
                )
              ],
            ),
          ),
        ],
      ),
    );

/// update Data
void updateData(context,UserModel model,int num) {
  TextEditingController updateController= num ==1 ?
  TextEditingController(text: model.data!.name):num ==2?TextEditingController(text: model.data!.phone):
  TextEditingController(text: model.data!.email);
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Update Data'),
          content: TextField(
            controller: updateController,
            decoration: const InputDecoration(border: OutlineInputBorder()),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            TextButton(
                onPressed: () {
                  if(num == 1){
                    AuthCubit.get(context).updateUserDta(
                        name: updateController.text,
                        phone: model.data!.phone,
                        email: model.data!.email
                    );
                  }else if(num ==2){
                    AuthCubit.get(context).updateUserDta(
                        name: model.data!.name,
                        phone: updateController.text,
                        email: model.data!.email
                    );
                  }else if(num ==3){
                    AuthCubit.get(context).updateUserDta(
                        name: model.data!.name,
                        phone: model.data!.phone,
                        email:updateController.text
                    );
                  }

                  Navigator.pop(context);
                },
                child: const Text('Update')),
          ],
        );
      });
}
