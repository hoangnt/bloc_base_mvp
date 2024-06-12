import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/config/app_navigator_key.dart';
import 'package:monki_bloc/config/injection.dart';
import 'package:monki_bloc/features/entry/blocs/entry_bloc.dart';
import 'package:monki_bloc/features/entry/screen/entry_screen.dart';
import 'package:monki_bloc/features/home/blocs/home_bloc.dart';
import 'package:monki_bloc/features/profile/blocs/profile_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EntryBloc()),
        BlocProvider(create: (context) => HomeBloc(getIt())),
        BlocProvider(create: (context) => ProfileBloc(getIt())),
      ],
      child: MaterialApp(
        navigatorKey: AppNavigatorKey.navigatorKey,
        home: const EntryScreen(),
      ),
    );
  }
}
