import 'package:monki_bloc/common/constant/status_code.dart';
import 'package:monki_bloc/common/network/model/base_response.dart';
import 'package:monki_bloc/common/network/network_client.dart';
import 'package:monki_bloc/features/profile/model/user_profile_model.dart';
import 'package:monki_bloc/features/profile/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final String _getProfileEndpoint = "/get_profile";

  @override
  Future<BaseResponse<UserProfileModel>> getUserProfile() async {
    final res = await NetworkClient().get(
      endpoint: _getProfileEndpoint,
      params: {},
    );

    if (res.statusCode != StatusCode.success) {
      return BaseResponse<UserProfileModel>(
        statusCode: StatusCode.success,
        data: null,
      );
    }

    return BaseResponse<UserProfileModel>(
      statusCode: StatusCode.success,
      data: res.data != null ? UserProfileModel.fromJson(res.data) : null,
    );
  }
}
