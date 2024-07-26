import 'package:sesbloc1/repository/todo_service/i_todo_service.dart';
import 'package:sesbloc1/repository/todo_service/todomodel.dart';

class MockTodoService implements ITodoService {
  @override
  Future<TodoModel> createTodo({required TodoModel newTodo}) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTodo({required TodoModel todo}) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoModel> editTodo({required TodoModel edititedTodo}) {
    // TODO: implement editTodo
    throw UnimplementedError();
  }

  @override
  Future<List<TodoModel>> getAllTodo() async {
    await Future.delayed(Duration(milliseconds: 750));
    return [
      TodoModel(
          id: 1,
          title: "Hello this is titile one",
          description: "Hello this is description two"),
      TodoModel(
          id: 2,
          title: "Grocery items",
          description: "1. Onion, 2. Tomato, 3. Potato...."),
    ];
  }

  @override
  Future<TodoModel> getTodoById({required String id}) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }
}
