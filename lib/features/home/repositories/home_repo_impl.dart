import 'package:monki_bloc/common/constant/status_code.dart';
import 'package:monki_bloc/common/network/model/base_response.dart';
import 'package:monki_bloc/features/home/model/meal_model.dart';
import 'package:monki_bloc/features/home/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<BaseResponse<List<MealModel>>> getAllMeal() async {
    return BaseResponse<List<MealModel>>(
      statusCode: StatusCode.success,
      data: [],
    );
  }

  @override
  Future<BaseResponse<MealModel>> getSingleMeal(String id) async {
    return BaseResponse<MealModel>(
      statusCode: StatusCode.success,
      data: null,
    );
  }
}
