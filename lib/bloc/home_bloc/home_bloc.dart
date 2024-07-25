import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sesbloc1/event/i_event.dart';
import 'package:sesbloc1/event/increment_event.dart';
import 'package:sesbloc1/repository/todo_service/i_todo_service.dart';
import 'package:sesbloc1/state/error_state.dart';
import 'package:sesbloc1/state/i_state.dart';
import 'package:sesbloc1/state/show_data_state.dart';

import '../../event/decrement_event.dart';

class HomeBloc extends Bloc<IEvent, IState> {
  HomeBloc(super.initialState) {
    on((event, emit) {
      onEventHaneler(emit: emit, event: (event as IEvent));
    });
  }

  // Event handeler
  void onEventHaneler({required IEvent event, required Emitter<IState> emit}) {
    if (event is IncrementEvent) {
      increment(emit: emit, event: event);
    } else if (event is DecrementEvent) {
      decrement(event: event, emit: emit);
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
      getAllTodo();
    } catch (e) {
      var errorState = ErrorState();
      errorState.errorMessage = e.toString();
      emit(errorState);
    }
  }

  Future<void> getAllTodo() async {
    // service call
    var todoService = GetIt.I.get<ITodoService>();
    var data = await todoService.getAllTodo();
    data.forEach((e) {
      print(e.description);
    });
  }
}
