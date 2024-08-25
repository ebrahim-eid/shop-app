import 'package:flutter/material.dart';
import '../../../../data/models/shop_models/home_model.dart';
import '../../../controllers/shop_cubit/shop_cubit.dart';

/// Grid
Widget productsHomeGrid(context, HomeModel homeModel) => Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1 / 1.7,
        // height / width
        children: List.generate(homeModel.products.length,
            (index) => productsHomeElement(context, homeModel, index)),
      ),
    );

/// items
Widget productsHomeElement(context, HomeModel homeModel, int index) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage(homeModel.products[index].image),
              height: 200,
              width: 200,
            ),
            if (homeModel.products[index].discount != 0)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: const Text(
                  'DISCOUNT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                homeModel.products[index].name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '${homeModel.products[index].price}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (homeModel.products[index].discount != 0)
                    Text(
                      '${homeModel.products[index].oldPrice}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.black,
                          fontSize: 14,
                          color: Colors.grey[500]),
                    ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      ShopCubit.get(context)
                          .addToFavorite(homeModel.products[index].id);
                    },
                    child: homeModel.products[index].inFavorites == true
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
        ),
      ],
    );
