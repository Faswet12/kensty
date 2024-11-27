import 'dart:core';


import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kensty/modules/kensty_app/splash/splash_cubit/splash_states.dart';
import '../../../../shared/networks/local/app_localizations.dart';


class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitialState()){
    navigateToLogin();
  }

  static SplashCubit get(context) => BlocProvider.of(context);

  String getCopyRight(BuildContext context){
    return AppLocalizations.of(context)?.get('copyRight') ?? 'CopyRight';
  }
  String getSplashTitle(BuildContext context){
    return AppLocalizations.of(context)?.get('splashTitle') ?? 'splashTitle';
  }

  void navigateToLogin() {
    emit(SplashLoadingState());
    Future.delayed(const Duration(seconds: 4), () {
      emit(SplashState());
    });
    emit(SplashState());
  }
}