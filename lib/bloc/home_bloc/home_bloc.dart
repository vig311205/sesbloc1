import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sesbloc1/event/get_all_todo_event.dart';
import 'package:sesbloc1/event/i_event.dart';
import 'package:sesbloc1/event/increment_event.dart';
import 'package:sesbloc1/repository/todo_service/i_todo_service.dart';
import 'package:sesbloc1/state/error_state.dart';
import 'package:sesbloc1/state/i_state.dart';
import 'package:sesbloc1/state/loading_state.dart';
import 'package:sesbloc1/state/show_all_todo_state.dart';
import 'package:sesbloc1/state/show_data_state.dart';

import '../../event/decrement_event.dart';

class HomeBloc extends Bloc<IEvent, IState> {
  HomeBloc(super.initialState) {
    on((event, emit) async {
      await onEventHaneler(emit: emit, event: (event as IEvent));
    });
  }

  // Event handeler
  Future<void> onEventHaneler(
      {required IEvent event, required Emitter<IState> emit}) async {
    if (event is IncrementEvent) {
      increment(emit: emit, event: event);
    } else if (event is DecrementEvent) {
      decrement(event: event, emit: emit);
    } else if (event is GetAllTodoEvent) {
      await getAllTodo(event: event, emit: emit);
    }
  }

  void increment({
    required IncrementEvent event,
    required Emitter<IState> emit,
  }) {
    try {
      var currentState = event.currentState;
      var newSatate = ShowDataState();
      newSatate.value = currentState.value + 1;

      // State dispatch
      emit(newSatate);
    } catch (e) {
      var errorState = ErrorState();
      errorState.errorMessage = e.toString();
      emit(errorState);
    }
  }

  void decrement({
    required DecrementEvent event,
    required Emitter<IState> emit,
  }) {
    try {
      var currentState = event.currentState;
      var newSatate = ShowDataState();
      newSatate.value = currentState.value - 1;

      // State dispatch
      emit(newSatate);
    } catch (e) {
      var errorState = ErrorState();
      errorState.errorMessage = e.toString();
      emit(errorState);
    }
  }

  Future<void> getAllTodo(
      {required Emitter<IState> emit, required GetAllTodoEvent event}) async {
    emit(LoadingState());
    print("Hello");
    var todoService = GetIt.I.get<ITodoService>();
    var data = await todoService.getAllTodo();
    ShowAllTodoState state = ShowAllTodoState();
    state.collectionOfAllTodos = data;
    print("Hello2");
    print(data);
    emit(state);
  }
}
