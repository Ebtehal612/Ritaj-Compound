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
import '../../data/auth/remote/auth_remote_data_source.dart';
import '../../data/permits/remote/permits_remote_data_source.dart';
import '../../data/permits/repo/permits_repo_impl.dart';
import '../../domain/permits/repo/permits_repo.dart';
import '../../domain/permits/use_cases/create_visitor_permit_use_case.dart';
import '../../domain/permits/use_cases/get_active_permits_use_case.dart';
import '../../domain/permits/use_cases/delete_visitor_permit_use_case.dart';
import '../../presentation/permits/cubit/permits_cubit.dart';
import '../../presentation/permits/cubit/create_visitor_permit_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => createDio());

  // Core
  sl.registerLazySingleton<SharedPrefs>(() => SharedPrefs(sl(), sl()));
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton(() => AppRouter());
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());

  // Data Sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<PermitsRemoteDataSource>(
      () => PermitsRemoteDataSourceImpl(sl()));

  // Cubits
  sl.registerLazySingleton<UserCubit>(() => UserCubit(sl()));
  sl.registerLazySingleton(() => LoginCubit(sl(), sl()));
  sl.registerLazySingleton(() => PermitsCubit(sl(), sl()));
  sl.registerFactory(() => CreateVisitorPermitCubit(sl()));

  //! UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => CreateVisitorPermitUseCase(sl()));
  sl.registerLazySingleton(() => GetActivePermitsUseCase(sl()));
  sl.registerLazySingleton(() => DeleteVisitorPermitUseCase(sl()));

  //! Repos
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<PermitsRepo>(() => PermitsRepoImpl(sl()));
}
