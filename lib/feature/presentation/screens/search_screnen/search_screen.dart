import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/reuable_widgets/reusable_widgets.dart';
import '../../controllers/search_cubit/search_cubit.dart';
import '../../controllers/search_cubit/search_states.dart';
import '../../widgets/search_widget/search_widgets.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget{
   SearchScreen({super.key});
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SearchCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<SearchCubit,SearchStates>(
          listener: (context,state){},
          builder: (context,state){
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  defaultFormField(
                      context,
                      controller: controller,
                      type: TextInputType.text,
                      validateMessage: 'Enter product name',
                      hint: 'Search',
                      prefixIcon: Icons.search,
                      onChanged: (value){
                        SearchCubit.get(context).searchProduct(value);
                      }
                  ),
                  const SizedBox(height: 4,),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(),
                  if (SearchCubit.get(context).searchModel !=null)
                    Expanded(child: searchListWidget(context, SearchCubit.get(context).searchModel!))
                ],
              ),
            );
          },
        ),
      ),
    );

  }
}