import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/entry/blocs/entry_bloc.dart';
import 'package:monki_bloc/features/entry/blocs/entry_state.dart';
import 'package:monki_bloc/features/home/screen/home_screen.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<EntryCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("this is entry"),
      ),
      body: BlocBuilder<EntryCubit, EntryState>(
        builder: (context, state) {
          return PageView(
            controller: bloc.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeScreen(),
              Container(
                color: Colors.redAccent,
              ),
              Container(
                color: Colors.greenAccent,
              ),
              Container(
                color: Colors.blueAccent,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<EntryCubit, EntryState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.currentIndex ?? 0,
            onTap: (index) {
              bloc.changeTab(index);
            },
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Red',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Green',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Blue',
              ),
            ],
            selectedItemColor: Colors.greenAccent,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(color: Colors.greenAccent),
          );
        },
      ),
    );
  }
}
