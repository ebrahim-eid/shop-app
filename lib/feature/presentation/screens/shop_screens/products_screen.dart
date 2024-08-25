import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/shop_cubit/shop_cubit.dart';
import '../../controllers/shop_cubit/shop_states.dart';
import '../../widgets/shop_widgets/home_widgets/home_widgets.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
        builder: (context,state){
          return ShopCubit.get(context).homeModel !=null && ShopCubit.get(context).categoriesModel !=null?
          homeBuilder(context, homeModel: ShopCubit.get(context).homeModel!,
              categories: ShopCubit.get(context).categoriesModel!):
          const Center(child:CircularProgressIndicator());
        },
    );
  }
}
