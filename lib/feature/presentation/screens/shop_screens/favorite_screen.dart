import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controllers/shop_cubit/shop_cubit.dart';
import '../../controllers/shop_cubit/shop_states.dart';
import '../../widgets/shop_widgets/favorite_widgets/favorite_widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is AddToFavLoadingState){
          showDialog(
              context: context,
              builder: (context)=>const Center(child:  CircularProgressIndicator(strokeWidth: 8,))
          );
        }else{
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        }
      },
      builder: (context, state) {
        return ShopCubit.get(context).getFavoriteModel !=null ?
        ShopCubit.get(context).getFavoriteModel!.data !=[] ?
        favoriteListWidget(context,ShopCubit.get(context).getFavoriteModel!):noFavItems()
            :const Center(child: CircularProgressIndicator());
      },
    );
  }
}
