import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/entry/blocs/entry_bloc.dart';
import 'package:monki_bloc/features/entry/blocs/entry_state.dart';
import 'package:monki_bloc/features/home/screen/home_screen.dart';
import 'package:monki_bloc/features/profile/screen/profile_screen.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<EntryBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("this is appbar"),
      ),
      body: BlocBuilder<EntryBloc, EntryState>(
        builder: (context, state) {
          return PageView(
            controller: bloc.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              Center(
                child: Text("this is search screen"),
              ),
              Center(
                child: Text("this is monki cash screen"),
              ),
              HomeScreen(),
              Center(
                child: Text("this is order screen"),
              ),
              ProfileScreen()
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<EntryBloc, EntryState>(
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
                icon: Icon(Icons.search),
                label: '검색',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monetization_on),
                label: '먼키캐시',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'MONKI',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit_calendar),
                label: '주문내역',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'My먼키',
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
