import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:sesbloc1/repository/todo_service/i_todo_service.dart';
import 'package:sesbloc1/repository/todo_service/todomodel.dart';
import 'package:http/http.dart' as http;

class TodoService implements ITodoService {
  final String baseUrl;

  TodoService({required this.baseUrl});

  @override
  Future<TodoModel> createTodo({required TodoModel newTodo}) async {
    // TODO: implement getTodoById
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
    var url = Uri.https(baseUrl, "/todos");

    var response = await http.get(url);

    var decodedData = (jsonDecode(response.body) as List);
    return decodedData.map((data) => TodoModel.fromJson(data)).toList();
  }

  @override
  Future<TodoModel> getTodoById({required String id}) {
    // TODO: implement getTodoById
    throw UnimplementedError();
  }
}
