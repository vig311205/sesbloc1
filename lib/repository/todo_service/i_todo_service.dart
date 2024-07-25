import 'package:sesbloc1/repository/todo_service/todomodel.dart';

abstract class ITodoService {
  /// Function to get all todos
  Future<List<TodoModel>> getAllTodo();

  /// Function to get the specific todo using id
  Future<TodoModel> getTodoById({required String id});

  /// Funtion to crate a new todo
  Future<TodoModel> createTodo({required TodoModel newTodo});

  /// Funtion to edit a todo based up on id and new todo
  Future<TodoModel> editTodo({required TodoModel edititedTodo});

  /// Function to delete todo based up on id
  Future<bool> deleteTodo({required TodoModel todo});
}
