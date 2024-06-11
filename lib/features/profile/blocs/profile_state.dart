import 'package:equatable/equatable.dart';
import 'package:monki_bloc/features/profile/model/user_profile_model.dart';

class ProfileState extends Equatable {
  final UserProfileModel? userProfile;

  const ProfileState({this.userProfile});

  ProfileState copyWith({UserProfileModel? userProfile}) => ProfileState(
        userProfile: userProfile ?? this.userProfile,
      );

  @override
  List<Object?> get props => [userProfile];
}
