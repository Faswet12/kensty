import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/networks/local/app_localizations.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Key? loginFormKry;
  TextEditingController? aridTextController;
  TextEditingController? passwordTextController;
  bool isShowed=true ;

  String getLoginTitle(BuildContext context){
    return AppLocalizations.of(context)?.get('loginTitle') ?? 'LoginTitle';
  }
  String getLoginButton(BuildContext context){
    return AppLocalizations.of(context)?.get('login') ?? 'login';
  }
  String getLoginSucceed(BuildContext context){
    return AppLocalizations.of(context)?.get('loginSucceed') ?? 'loginSucceed';
  }
  String getUserValidate1(BuildContext context){
    return AppLocalizations.of(context)?.get('userValidate1') ?? 'userValidate1';
  }
  String getUserValidate2(BuildContext context){
    return AppLocalizations.of(context)?.get('userValidate2') ?? 'userValidate2';
  }
  String getPasswordValidate1(BuildContext context){
    return AppLocalizations.of(context)?.get('passwordValidate1') ?? 'userValidate1';
  }
  String getPasswordValidate2(BuildContext context){
    return AppLocalizations.of(context)?.get('passwordValidate2') ?? 'userValidate2';
  }
  String getUserTitle(BuildContext context){
    return AppLocalizations.of(context)?.get('userTitle') ?? 'userTitle';
  }
  String getPasswordTitle(BuildContext context){
    return AppLocalizations.of(context)?.get('passwordTitle') ?? 'passwordTitle';
  }
  bool validateUsername(String username) {
    final regex = RegExp(r'^E1C1F\d+NR\d+$');
    return regex.hasMatch(username);
  }

  void isHidden(){
    isShowed=!isShowed;
    emit(LoginPasswordShowedState());
  }

}