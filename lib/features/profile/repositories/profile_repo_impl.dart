import 'package:monki_bloc/common/network/model/base_response.dart';
import 'package:monki_bloc/features/profile/model/user_profile_model.dart';
import 'package:monki_bloc/features/profile/repositories/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<BaseResponse<UserProfileModel>> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }
}
