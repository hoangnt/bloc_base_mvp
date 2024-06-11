import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/home/blocs/home_bloc.dart';
import 'package:monki_bloc/features/home/blocs/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = BlocProvider.of<HomeBloc>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // _bloc.getAllMeal();
      // _bloc.getSingleMeal("id_meal");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            children: [
              Text("this is home screen"),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.meal == null) {
                return const Text("no data");
              }

              return const Text("meal");
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.listMeal.isEmpty) {
                return const Text("no data list meal");
              }

              return const Text("list meal");
            },
          ),
        ],
      ),
    );
  }
}
