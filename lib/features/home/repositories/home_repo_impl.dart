import 'package:monki_bloc/common/constant/status_code.dart';
import 'package:monki_bloc/common/network/model/base_response.dart';
import 'package:monki_bloc/common/network/network_client.dart';
import 'package:monki_bloc/features/home/model/meal_model.dart';
import 'package:monki_bloc/features/home/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final String _getMealEndpoint = "/get_a_meal";
  final String _getListMealEndpoint = "/get_list_meal";

  @override
  Future<BaseResponse<List<MealModel>>> getAllMeal() async {
    final res = await NetworkClient().get(
      endpoint: _getListMealEndpoint,
      params: {},
    );

    if (res.statusCode != StatusCode.success) {
      return BaseResponse<List<MealModel>>(
        statusCode: StatusCode.success,
        data: [],
      );
    }

    return BaseResponse<List<MealModel>>(
      statusCode: StatusCode.success,
      data: res.data != null
          ? (res.data as List).map((val) => MealModel.fromJson(val)).toList()
          : [],
    );
  }

  @override
  Future<BaseResponse<MealModel>> getSingleMeal(String id) async {
    final res = await NetworkClient().get(
      endpoint: _getMealEndpoint,
      params: {},
    );

    if (res.statusCode != StatusCode.success) {
      return BaseResponse<MealModel>(
        statusCode: StatusCode.success,
        data: null,
      );
    }

    return BaseResponse<MealModel>(
      statusCode: StatusCode.success,
      data: res.data != null ? MealModel.fromJson(res.data) : null,
    );
  }
}
