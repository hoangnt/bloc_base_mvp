import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/entry/blocs/entry_state.dart';

class EntryCubit extends Cubit<EntryState> {
  EntryCubit() : super(const EntryState());

  final PageController pageController = PageController();

  void goHome() {
    emit(state.copyWith(index: 0));
  }

  void changeTab(int newIndex) {
    emit(state.copyWith(index: newIndex));
    pageController.jumpToPage(newIndex);
  }
}
