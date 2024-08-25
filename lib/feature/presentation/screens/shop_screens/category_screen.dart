import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/shop_cubit/shop_cubit.dart';
import '../../controllers/shop_cubit/shop_states.dart';
import '../../widgets/shop_widgets/categories_widgets/categories_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return ShopCubit.get(context).categoriesModel !=null?
        categoriesList(ShopCubit.get(context).categoriesModel!):
        const Center(child:  CircularProgressIndicator());
      },
    );
  }
}
