import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:ritaj_compound/app/route_manager/app_router.dart';
import 'package:ritaj_compound/data/auth/repo/auth_repo_impl.dart';
import 'package:ritaj_compound/domain/auth/repo/auth_repo.dart';
import 'package:ritaj_compound/domain/auth/use_cases/login_use_case/login_use_case.dart';
import 'package:ritaj_compound/presentation/login/cubit/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/localization/localization_manager.dart';
import '../../core/shared_preferences/shared_prefs.dart';
import '../../core/theme/app_theme.dart';
import 'package:dio/dio.dart';
import '../../core/network/network_setup.dart';
import '../../core/cubits/user_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => Dio());

  // Core
  sl.registerLazySingleton<SharedPrefs>(() => SharedPrefs(sl(), sl()));
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton(() => AppRouter());
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  // Cubits
  sl.registerLazySingleton<UserCubit>(() => UserCubit(sl()));
  sl.registerLazySingleton(() => LoginCubit(sl(), sl()));

  //! UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));

  //! Repos
  sl.registerLazySingleton<AuthRepo>(() => const AuthRepoImpl());
}
