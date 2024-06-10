import 'package:equatable/equatable.dart';
import 'package:monki_bloc/features/home/model/meal_model.dart';

class HomeState extends Equatable {
  final List<MealModel> listMeal;
  final MealModel? meal;

  const HomeState({
    this.listMeal = const [],
    this.meal,
  });

  HomeState copyWith({
    List<MealModel>? listMeal,
    MealModel? meal,
  }) =>
      HomeState(
        listMeal: listMeal ?? this.listMeal,
        meal: meal ?? this.meal,
      );

  @override
  List<Object?> get props => [listMeal, meal];
}
