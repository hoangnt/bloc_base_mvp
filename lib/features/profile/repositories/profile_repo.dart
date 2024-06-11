import 'package:monki_bloc/common/network/model/base_response.dart';
import 'package:monki_bloc/features/profile/model/user_profile_model.dart';

abstract class ProfileRepo {
  Future<BaseResponse<UserProfileModel>> getUserProfile();
}
