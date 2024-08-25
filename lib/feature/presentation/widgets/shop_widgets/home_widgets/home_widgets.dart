import 'package:flutter/material.dart';
import 'package:shop_application/feature/presentation/widgets/shop_widgets/home_widgets/products_home_widget.dart';
import '../../../../data/models/shop_models/categories_model.dart';
import '../../../../data/models/shop_models/home_model.dart';
import 'carouselslider_widget.dart';
import 'categories_home_widget.dart';

Widget homeBuilder(context,{
  required HomeModel homeModel,
  required CategoriesModel categories
}) => SingleChildScrollView(
  physics: const BouncingScrollPhysics(),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// CarouselSlider
      caroselSliderWidget(homeModel),
      const SizedBox(
        height: 20,
      ),
      /// categories
      categoriesHomeWidget(categories),
      const SizedBox(
        height: 20,
      ),
      /// products
      productsHomeGrid(context,homeModel),
    ],
  ),
);

