import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sesbloc1/repository/todo_service/i_todo_service.dart';
import 'package:sesbloc1/repository/todo_service/todo_service.dart';
import 'app.dart';
import 'constants/app_constants.dart';

void main() {
  serviceLocatorInitialization();
  runApp(const MainApp());
}

void serviceLocatorInitialization() {
  GetIt.I
      .registerSingleton<ITodoService>(TodoService(baseUrl: dev_api_base_url));
}
