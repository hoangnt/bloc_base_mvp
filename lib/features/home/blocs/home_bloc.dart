import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/common/mixin/base_response_handle_mixin.dart';
import 'package:monki_bloc/features/home/blocs/home_state.dart';
import 'package:monki_bloc/features/home/model/meal_model.dart';
import 'package:monki_bloc/features/home/repositories/home_repo.dart';

class HomeBloc extends Cubit<HomeState> with BaseResponseHandleMixin {
  HomeBloc(this.repo) : super(const HomeState());

  late final HomeRepo repo;

  void getAllMeal() async {
    handleBaseResponse<List<MealModel>>(
      api: repo.getAllMeal(),
      onSuccess: (data) {
        emit(state.copyWith(listMeal: data));
      },
    );
  }

  void getSingleMeal(String id) {
    handleBaseResponse<MealModel?>(
      api: repo.getSingleMeal(id),
      onSuccess: (data) {
        emit(state.copyWith(meal: data));
      },
    );
  }
}
