import 'package:sesbloc1/state/i_state.dart';

class ErrorState implements IState {
  String errorMessage = "";

  @override
  int value = 0;
}
