import "i_state.dart";
import '../repository/todo_service/todomodel.dart';

class ShowAllTodoState implements IState {
  @override
  int value = 0;

  List<TodoModel> collectionOfAllTodos = [];
}
