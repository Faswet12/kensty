
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/widgets/custom_button.dart';
import '../../../shared/components/widgets/custom_snakbar.dart';
import '../../../shared/styles/colors.dart';
import 'login_cubit/login_cubit.dart';
import 'login_cubit/login_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocConsumer<LoginCubit,LoginStates>(
              builder: (context, state) {
                var cubit = LoginCubit.get(context);
                return Scaffold(
                  body: Form(
                      key: cubit.loginFormKry,
                      autovalidateMode:
                      AutovalidateMode.onUserInteraction, // Enable auto validation
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cubit.getLoginTitle(context),
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkTan,
                              ),
                            ),
                            const SizedBox(height: 60),
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return cubit.getUserValidate1(context);
                                }else if(!cubit.validateUsername(value)){
                                  return cubit.getUserValidate2(context);
                                }
                                return null;
                              },
                              cursorColor: AppColors.darkTan,
                              controller: cubit.aridTextController,
                              decoration: InputDecoration(
                                labelText: cubit.getUserTitle(context),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.gray,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    const BorderSide(color: AppColors.darkTan)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: AppColors.darkTan),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              obscureText: cubit.isShowed,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return cubit.getPasswordValidate1(context);
                                } else if (value.length < 8) {
                                  return cubit.getPasswordValidate2(context);
                                }
                                return null;
                              },
                              cursorColor: AppColors.darkTan,
                              controller: cubit.passwordTextController,
                              decoration: InputDecoration(
                                suffixIconColor: AppColors.darkTan,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    cubit.isHidden();
                                  },
                                  icon: cubit.isShowed
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                ),
                                labelText: cubit.getPasswordTitle(context),
                                labelStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.gray,
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                    const BorderSide(color: AppColors.darkTan)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: AppColors.darkTan),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            CustomButton(
                              text:cubit.getLoginButton(context),
                              height: 50,
                              onPressed: (){
                                showTopSnackBar(context, cubit.getLoginSucceed(context));
                              },
                              btnColor: AppColors.darkTan,
                            ),
                          ],
                        ),
                      )
                  )
              );
              },
              listener: (context, state) {
              },
          ),
      );
  }
}
