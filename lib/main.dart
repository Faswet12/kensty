import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kensty/layout/kensty_app/cubit/kensty_cubit.dart';
import 'package:kensty/layout/kensty_app/cubit/kensty_states.dart';
import 'package:kensty/routes/app_pages.dart';
import 'package:kensty/routes/app_routes.dart';
import 'package:kensty/shared/networks/local/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => KenstyCubit()),
      ],
      child: BlocConsumer<KenstyCubit, KenstyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          Locale currentLocale = const Locale('ar', 'EG');
          if (state is KenstyLanguageChangedState) {
            currentLocale = state.locale;
          }
          return MaterialApp(
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', 'US'), // English
              Locale('ar', 'EG'), // Arabic
            ],
            initialRoute: AppRoutes.splash, // Define your initial route
            onGenerateRoute: AppRouter.generateRoute,
            locale: currentLocale,
            title: 'AR Club',
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            builder: (context, child) {
              return Directionality(
                  textDirection: currentLocale.languageCode == 'ar'?
                  TextDirection.rtl :
                  TextDirection.ltr,
                  child: child!);
            },
          );
        },
      ),
    );
  }
}