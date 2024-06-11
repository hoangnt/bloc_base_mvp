import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/common/mixin/base_response_handle_mixin.dart';
import 'package:monki_bloc/features/profile/blocs/profile_state.dart';
import 'package:monki_bloc/features/profile/model/user_profile_model.dart';
import 'package:monki_bloc/features/profile/repositories/profile_repo.dart';

class ProfileBloc extends Cubit<ProfileState> with BaseResponseHandleMixin {
  ProfileBloc(this.repo) : super(const ProfileState());

  late final ProfileRepo repo;

  Future<void> getProfile() async {
    handleBaseResponse<UserProfileModel?>(
      api: repo.getUserProfile(),
      onSuccess: (data) {
        emit(state.copyWith(userProfile: data));
      },
    );
  }
}
