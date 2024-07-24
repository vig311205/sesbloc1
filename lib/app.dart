import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sesbloc1/bloc/home_bloc/home_bloc.dart';
import 'package:sesbloc1/pages/home_page.dart';
import 'package:sesbloc1/state/show_data_state.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => HomeBloc(
          ShowDataState()..value = 0,
        ),
        child: const HomePage(),
      ),
    );
  }
}
