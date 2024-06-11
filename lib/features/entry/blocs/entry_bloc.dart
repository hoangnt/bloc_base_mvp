import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/common/constant/entry_tab_index.dart';
import 'package:monki_bloc/features/entry/blocs/entry_state.dart';
import 'package:monki_bloc/features/home/screen/home_screen.dart';
import 'package:monki_bloc/features/profile/screen/profile_screen.dart';

class EntryBloc extends Cubit<EntryState> {
  EntryBloc() : super(const EntryState());

  final PageController pageController = PageController(initialPage: 2);

  void goHome() {
    emit(state.copyWith(index: 2));
    pageController.jumpToPage(2);
  }

  void changeTab(int index) {
    List<Widget> listScreen = state.listScreen.map((val) => val).toList();

    if (index == EntryTabIndex.home &&
        listScreen[index].runtimeType != HomeScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, const HomeScreen());
    }

    if (index == EntryTabIndex.profile &&
        listScreen[index].runtimeType != ProfileScreen) {
      listScreen.removeAt(index);
      listScreen.insert(index, const ProfileScreen());
    }

    emit(
      state.copyWith(
        index: index,
        listScreen: listScreen,
      ),
    );
  }
}
