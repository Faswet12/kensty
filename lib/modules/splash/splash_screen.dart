
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kensty/modules/splash/splash_cubit/splash_cubit.dart';
import 'package:kensty/modules/splash/splash_cubit/splash_states.dart';

import '../../routes/app_routes.dart';
import '../../shared/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SplashCubit(),
      child: BlocConsumer<SplashCubit,SplashStates>(
        listener: (context, state) {
          if (state is SplashState) {
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login,(route) => false,);
          }
    },
        bloc: SplashCubit(),
        builder: (context, state) {
          var cubit = SplashCubit.get(context);
          return Scaffold(
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Image(image: AssetImage('assets/icons/ic_logo_main.png')
                  ,width: 150,
                  height: 150,),
                  Text("Ava Rewase Church",style: TextStyle(
                    fontSize: 20,
                    color: AppColors.darkTan
                  ),),
                  Spacer(),
                ],
              ),
              Text(cubit.getCopyRight(context),
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.boulder,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
        },
      ),
    );
  }
}
