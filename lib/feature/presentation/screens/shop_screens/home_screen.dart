import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shop_application/feature/presentation/screens/shop_screens/products_screen.dart';
import 'package:shop_application/feature/presentation/screens/search_screnen/search_screen.dart';
import 'package:shop_application/feature/presentation/screens/shop_screens/settings_screen.dart';
import '../../../../core/helper/helper_functions/helper_functions.dart';
import '../../controllers/shop_cubit/shop_cubit.dart';
import '../../controllers/shop_cubit/shop_states.dart';
import '../../widgets/shop_widgets/bottom_navigationbar_widgets.dart';
import 'category_screen.dart';
import 'favorite_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  List<Widget>screens= const [
    ProductsScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){},
        builder: (context,state){
          var currentIndex = ShopCubit.get(context).currentIndex;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              title:  Text('Discover',style: Theme.of(context).textTheme.headlineMedium,),
              actions: [
                IconButton(onPressed: (){
                  HelperFunctions.navigateTo(context, SearchScreen());
                }, icon: const Icon(Icons.search))
              ],
            ),
            body: IndexedStack(
              index: currentIndex,
              children: screens,
            ),
            bottomNavigationBar: SalomonBottomBar(
              currentIndex: currentIndex,
              onTap: (index){
                ShopCubit.get(context).changeBottomNavIndex(index);
              },
              items: bottomNavItems,
            ),
          );

        },);
  }
}
