import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/home/blocs/home_state.dart';
import 'package:monki_bloc/features/home/repositories/home_repo.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(this.repo) : super(const HomeState());

  late final HomeRepo repo;

  Future<void> getAllMeal() async {
    final res = await repo.getAllMeal();
    emit(
      state.copyWith(listMeal: res.data),
    );
  }

  Future<void> getSingleMeal(String id) async {
    final res = await repo.getSingleMeal(id);
    emit(
      state.copyWith(meal: res.data),
    );
  }
}
