
import 'i_event.dart';
import '../state/i_state.dart';

class GetAllTodoEvent implements IEvent {

    final IState currentState;

    GetAllTodoEvent({required this.currentState});
}