import 'package:flutter/material.dart';

import '../../../../data/models/shop_models/categories_model.dart';
/// categories list
Widget categoriesList(CategoriesModel model)=>ListView.separated(
    itemBuilder: (context,index)=>categoriesElements(model,index),
    separatorBuilder: (context,index)=>const Divider(indent: 20,endIndent: 20,thickness: 2,),
    itemCount: model.data.length
);
/// element
Widget categoriesElements(CategoriesModel model,int index)=>Padding(
  padding: const EdgeInsets.all(20),
  child: Row(
    children: [
      Image(
        image:
        NetworkImage(model.data[index].image),
        width: 90,
        height: 90,
      ),
      const SizedBox(width: 20,),
      Expanded(
        child: Text(model.data[index].name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
      InkWell(
        onTap: (){},
        child: const Icon(Icons.arrow_forward_ios_outlined,size: 35,),
      )
    ],
  ),
);