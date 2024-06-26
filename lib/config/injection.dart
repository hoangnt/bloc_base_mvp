import 'package:get_it/get_it.dart';
import 'package:monki_bloc/features/home/repositories/home_repo.dart';
import 'package:monki_bloc/features/home/repositories/home_repo_impl.dart';
import 'package:monki_bloc/features/profile/repositories/profile_repo.dart';
import 'package:monki_bloc/features/profile/repositories/profile_repo_impl.dart';

final getIt = GetIt.instance;

void dependenciesInjection() {
  getIt.registerSingleton<HomeRepo>(HomeRepoImpl());
  getIt.registerSingleton<ProfileRepo>(ProfileRepoImpl());
}
