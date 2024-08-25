import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/auth_cubit/auth_cubit.dart';
import '../../controllers/auth_cubit/auth_states.dart';
import '../../widgets/shop_widgets/settings_widgets/settings_main_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthStates>(
      listener: (context,state){},
      builder: (context,state){
        return AuthCubit.get(context).userModel !=null ?
        settingsMainWidget(context,AuthCubit.get(context).userModel!):
        const Center(child: CircularProgressIndicator());
      },
    );
  }
}
