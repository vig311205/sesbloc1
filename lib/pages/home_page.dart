import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sesbloc1/bloc/home_bloc/home_bloc.dart';
import 'package:sesbloc1/event/decrement_event.dart';
import 'package:sesbloc1/event/get_all_todo_event.dart';
import 'package:sesbloc1/event/increment_event.dart';
import 'package:sesbloc1/state/error_state.dart';
import 'package:sesbloc1/state/i_state.dart';
import 'package:sesbloc1/state/loading_state.dart';
import 'package:sesbloc1/state/show_all_todo_state.dart';
import 'package:sesbloc1/state/show_data_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(
          GetAllTodoEvent(
            currentState: ShowAllTodoState(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          BlocBuilder<HomeBloc, IState>(
            builder: (context, state) {
              return IconButton.filledTonal(
                onPressed: () {
                  context.read<HomeBloc>().add(
                        GetAllTodoEvent(
                          currentState: state,
                        ),
                      );
                },
                icon: const Icon(
                  Icons.refresh_rounded,
                ),
              );
            },
          ),
          BlocBuilder<HomeBloc, IState>(
            builder: (context, state) {
              return IconButton.filledTonal(
                onPressed: () {
                  context.read<HomeBloc>().add(
                        DecrementEvent(
                          currentState: state,
                        ),
                      );
                },
                icon: const Icon(
                  Icons.minimize,
                ),
              );
            },
          ),
          BlocBuilder<HomeBloc, IState>(
            builder: (context, state) {
              return IconButton.filledTonal(
                onPressed: () {
                  context.read<HomeBloc>().add(
                        IncrementEvent(
                          currentState: state,
                        ),
                      );
                },
                icon: const Icon(Icons.add_rounded),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, IState>(
        builder: (context, state) {
          return uiForState(state);
        },
      ),
    );
  }

  Widget uiForState(IState state) {
    if (state is ShowAllTodoState) {
      return ListView.builder(
        itemCount: state.collectionOfAllTodos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(state.collectionOfAllTodos[index].id.toString()),
            title: Text(state.collectionOfAllTodos[index].title.toString()),
            subtitle:
                Text(state.collectionOfAllTodos[index].description.toString()),
          );
        },
      );
    } else if (state is LoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ErrorState) {
      return Center(
        child: Text(state.errorMessage),
      );
    } else if (state is ShowDataState) {
      return Center(
        child: Text(
          state.value.toString(),
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      );
    }
    return const Center(
      child: Text("Something Went Wrong, try again later!"),
    );

    // switch (state.runtimeType) {
    //   case ShowAllTodoState:

    //     break;

    //   default:
    // }
  }
}
