import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/home/blocs/home_state.dart';
import 'package:monki_bloc/features/home/repositories/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(repo) : super(const HomeState());

  late HomeRepo repo;

  Future<void> getAllMeal() async {
    final res = await repo.getAllMeal();
    emit(
      state.copyWith(listMeal: res.data),
    );
  }

  Future<void> getSIngleMeal(String id) async {
    final res = await repo.getSingleMeal(id);
    emit(
      state.copyWith(meal: res.data),
    );
  }
}
