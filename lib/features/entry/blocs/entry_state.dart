import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:monki_bloc/features/home/screen/home_screen.dart';

class EntryState extends Equatable {
  final int? currentIndex;
  final List<Widget> listScreen;

  const EntryState({
    this.currentIndex = 2,
    this.listScreen = const [
      Center(
        child: Text("this is search screen"),
      ),
      Center(
        child: Text("this is monki cash screen"),
      ),
      HomeScreen(),
      SizedBox(),
      SizedBox(),
    ],
  });

  EntryState copyWith({
    int? index,
    List<Widget>? listScreen,
  }) =>
      EntryState(
        currentIndex: index ?? this.currentIndex,
        listScreen: listScreen ?? this.listScreen,
      );

  @override
  List<Object?> get props => [currentIndex];
}
