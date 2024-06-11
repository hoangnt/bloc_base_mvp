import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monki_bloc/features/profile/blocs/profile_state.dart';
import 'package:monki_bloc/features/profile/repositories/profile_repo.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc(this.repo) : super(const ProfileState());

  late final ProfileRepo repo;

  Future<void> getProfile() async {
    final res = await repo.getUserProfile();
    emit(
      state.copyWith(userProfile: res.data),
    );
  }
}
