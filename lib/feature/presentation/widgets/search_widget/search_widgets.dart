import 'package:flutter/material.dart';

import '../../../data/models/shop_models/search_model.dart';
import '../../controllers/shop_cubit/shop_cubit.dart';

/// search list
Widget searchListWidget(context,SearchModel model)=>ListView.separated(
    itemBuilder: (context,index)=> searchElement(context,model,index),
    separatorBuilder: (context,index)=> const Divider(indent: 20,endIndent: 20,thickness: 2,),
    itemCount: model.data.length
);

/// search item
Widget searchElement(context,SearchModel model,int index)=>Padding(
  padding: const EdgeInsets.all(20),
  child: SizedBox(
    height: 90,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: NetworkImage(model.data[index].image),
          width: 90,
          height: 90,
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.data[index].name,
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
                  Text('${model.data[index].price}',
                    style: const TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ShopCubit.get(context).addToFavorite(model.data[index].id);
                    },
                    child: model.data[index].inFavorites == true
                        ? const Icon(
                      Icons.favorite,
                      size: 25,
                      color: Colors.red,
                    )
                        : const Icon(
                      Icons.favorite_border,
                      size: 25,
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
