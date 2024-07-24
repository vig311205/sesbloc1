import 'package:sesbloc1/event/i_event.dart';

import '../state/i_state.dart';

class DecrementEvent implements IEvent {
  final IState currentState;

  DecrementEvent({required this.currentState});
}
