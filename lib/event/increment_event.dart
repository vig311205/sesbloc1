import 'package:sesbloc1/event/i_event.dart';

import '../state/i_state.dart';

class IncrementEvent implements IEvent {
  final IState currentState;

  IncrementEvent({required this.currentState});
}
