import 'package:monki_bloc/common/network/model/base_response.dart';
import 'package:monki_bloc/features/home/model/meal_model.dart';

abstract class HomeRepo {
  Future<BaseResponse<List<MealModel>>> getAllMeal();
  Future<BaseResponse<MealModel?>> getSingleMeal(String id);
}
