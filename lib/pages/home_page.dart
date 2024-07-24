import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sesbloc1/bloc/home_bloc/home_bloc.dart';
import 'package:sesbloc1/event/decrement_event.dart';
import 'package:sesbloc1/event/increment_event.dart';
import 'package:sesbloc1/state/i_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, IState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            actions: [
              IconButton.filledTonal(
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
              ),
              IconButton.filledTonal(
                onPressed: () {
                  context.read<HomeBloc>().add(
                        IncrementEvent(
                          currentState: state,
                        ),
                      );
                },
                icon: const Icon(Icons.add_rounded),
              ),
            ],
          ),
          body: Center(
            child: Text(
              state.value.toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        );
      },
    );
  }
}
