import 'package:flutter_bloc/flutter_bloc.dart';

import 'kensty_states.dart';

class KenstyCubit extends Cubit<KenstyStates> {

  KenstyCubit() : super((KenstyInitialState()));
  static Cubit get(context) => BlocProvider.of(context);

}
