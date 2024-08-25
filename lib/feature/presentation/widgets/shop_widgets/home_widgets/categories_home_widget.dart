import 'package:flutter/material.dart';

import '../../../../data/models/shop_models/categories_model.dart';

Widget categoriesHomeWidget(CategoriesModel categories)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'CATEGORIES',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      SizedBox(
        width: double.infinity,
        height: 120,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Image(
                      image: NetworkImage(''
                          '${categories.data[index].image}'),
                      width: 100,
                      height: 100,
                    ),
                    Container(
                        width: 100,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        color: Colors.black.withOpacity(0.8),
                        child: Text(
                          categories.data[index].name,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                          const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemCount: categories.data.length
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        'New Products',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    ],
  ),
);