import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

import '../../../../data/models/shop_models/home_model.dart';
/// CarouselSlider
Widget caroselSliderWidget(HomeModel model)=>CarouselSlider(
    items: model.banners
        .map((e) => Image(
      image: NetworkImage(
        e.image,
      ),
      width: double.infinity,
    )
    )
        .toList(),
    options: CarouselOptions(
        height: 250,
        initialPage: 0,
        autoPlay: true,
        viewportFraction: 1,
        reverse: false,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 500),
        autoPlayCurve: Curves.easeIn,
        scrollDirection: Axis.horizontal,
        scrollPhysics: const BouncingScrollPhysics()
    )
);