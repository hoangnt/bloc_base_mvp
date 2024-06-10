import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/config/injection.dart';
import 'package:monki_bloc/features/entry/blocs/entry_bloc.dart';
import 'package:monki_bloc/features/entry/screen/entry_screen.dart';
import 'package:monki_bloc/features/home/blocs/home_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EntryCubit()),
        BlocProvider(create: (context) => HomeCubit(getIt())),
      ],
      child: const MaterialApp(
        home: EntryScreen(),
      ),
    );
  }
}
