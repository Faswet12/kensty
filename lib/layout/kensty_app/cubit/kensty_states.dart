import 'dart:ui';

abstract class KenstyStates{}

class KenstyInitialState extends KenstyStates{}

class KenstyErrorState extends KenstyStates{}

class KenstyLoadingState extends KenstyStates{}

class KenstySuccessState extends KenstyStates{}

class KenstyLanguageChanged extends KenstyStates {
  final Locale locale;
  KenstyLanguageChanged(this.locale);
}
class KenstyLanguageInitial extends KenstyStates {}

class KenstyLanguageChangedState extends KenstyStates {
  final Locale locale;
  KenstyLanguageChangedState(this.locale);
}
class KenstyNavigateToLogin extends KenstyStates{}