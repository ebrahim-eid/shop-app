import 'package:flutter/material.dart';

import '../../../../data/models/shop_models/favorite_model.dart';
import '../../../controllers/shop_cubit/shop_cubit.dart';
/// favorite list
Widget favoriteListWidget(context,GetFavoriteModel model)=>ListView.separated(
    itemBuilder: (context,index)=> favoriteElements(context,model,index),
    separatorBuilder: (context,index)=> const Divider(indent: 20,endIndent: 20,thickness: 2,),
    itemCount: model.data!.length
);

/// favorite item
Widget favoriteElements(context,GetFavoriteModel model,int index)=>Padding(
  padding: const EdgeInsets.all(20),
  child: SizedBox(
    height: 90,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(model.data![index].image),
          width: 90,
          height: 90,
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            children: [
              Text(model.data![index].name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  if(model.data![index].discount !=0)
                  Text('${model.data![index].oldPrice}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough, // Adds a line above the text
                        decorationStyle: TextDecorationStyle.solid, // Line style (solid, dashed, dotted, etc.)
                        decorationColor: Colors.black,
                        fontSize: 14, color: Colors.blue),
                  ),
                  const SizedBox(width: 10,),
                  Text('${model.data![index].price}',
                    style: const TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ShopCubit.get(context).addToFavorite(model.data![index].id);
                    },
                    child: const Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.red,
                      // color: Colors.white,
                    ),
                  ),
                ],
              ),

            ],
          ),
        )
      ],
    ),
  ),
);

/// no favorites
Widget noFavItems()=> const SizedBox(
  width: 200,
  height: 200,
  child: Icon(Icons.list_alt_outlined,size: 80,color: Colors.red,),
);