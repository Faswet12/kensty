import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kensty/models/firebase/firebaseModel.dart';
import 'package:kensty/shared/networks/remote/getUsersData.dart';

import '../../../../shared/components/widgets/custom_snakbar.dart';
import '../../../../shared/networks/local/app_localizations.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState()) {
    aridTextController = TextEditingController();
    passwordTextController = TextEditingController();
    loginFormKry = GlobalKey<FormState>();
  }

  static LoginCubit get(context) => BlocProvider.of(context);

  late final GlobalKey<FormState> loginFormKry;
  late TextEditingController aridTextController;
  late TextEditingController passwordTextController; // Change these to non-nullable
  bool isShowed = true;
  String? massage;
  bool? loginSuccess;

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

  Future<void> login(BuildContext context) async {
    var user = FirebaseModel();
    emit(LoginLoadingState());
    try {
      user = await GetUsersData.retrieveUserData(aridTextController.text,passwordTextController.text);
      massage = user.message;
      loginSuccess=user.status;
      if(loginSuccess==false){
        emit(LoginErrorState(massage.toString()));
      }else if(user.status == true) {
        if(user.data==null){
          emit(LoginErrorState(massage.toString()));
        }else{
          emit(LoginSuccessState());
        }
        showTopSnackBar(context, massage.toString());
      }
    } catch (e) {
      emit(LoginErrorState(e.toString()));
    }
  }
  void isHidden(){
    isShowed=!isShowed;
    emit(LoginPasswordShowedState());
  }
  @override
  Future<void> close() {
    aridTextController.dispose();
    passwordTextController.dispose();
    return super.close();
  }
}