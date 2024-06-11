import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/entry/blocs/entry_state.dart';

class EntryBloc extends Cubit<EntryState> {
  EntryBloc() : super(const EntryState());

  final PageController pageController = PageController();

  void goHome() {
    emit(state.copyWith(index: 2));
    pageController.jumpToPage(2);
  }

  void changeTab(int newIndex) {
    emit(state.copyWith(index: newIndex));
    pageController.jumpToPage(newIndex);
  }
}
