import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:ritaj_compound/app/route_manager/app_router.dart';
import 'package:ritaj_compound/data/auth/repo/auth_repo_impl.dart';
import 'package:ritaj_compound/data/permits/remote/permits_remote_data_source.dart';
import 'package:ritaj_compound/data/permits/repo/permits_repo_impl.dart';
import 'package:ritaj_compound/domain/auth/repo/auth_repo.dart';
import 'package:ritaj_compound/domain/auth/use_cases/login_use_case/login_use_case.dart';
import 'package:ritaj_compound/domain/permits/repo/permits_repo.dart';
import 'package:ritaj_compound/domain/permits/use_cases/create_delivery_permit_use_case.dart';
import 'package:ritaj_compound/domain/permits/use_cases/create_visitor_permit_use_case.dart';
import 'package:ritaj_compound/domain/permits/use_cases/delete_delivery_permit_use_case.dart';
import 'package:ritaj_compound/domain/permits/use_cases/delete_visitor_permit_use_case.dart';
import 'package:ritaj_compound/domain/permits/use_cases/get_active_deliveries_use_case.dart';
import 'package:ritaj_compound/domain/permits/use_cases/get_active_permits_use_case.dart';
import 'package:ritaj_compound/presentation/login/cubit/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/localization/localization_manager.dart';
import '../../core/shared_preferences/shared_prefs.dart';
import '../../core/theme/app_theme.dart';
import '../../core/network/network_setup.dart';
import '../../core/cubits/user_cubit.dart';
import '../../data/auth/remote/auth_remote_data_source.dart';
import '../../data/permits/local/permits_local_data_source.dart';
import '../../domain/permits/use_cases/get_cached_visitors_use_case.dart';
import '../../domain/permits/use_cases/get_cached_deliveries_use_case.dart';
import '../../presentation/permits/cubit/visitors_cubit.dart';
import '../../presentation/permits/cubit/create_visitor_permit_cubit.dart';
import '../../presentation/permits/cubit/deliveries_cubit.dart';
import '../../presentation/permits/cubit/create_delivery_permit_cubit.dart';



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
  sl.registerLazySingleton<PermitsLocalDataSource>(
      () => PermitsLocalDataSourceImpl(sl()));

  // Cubits
  sl.registerLazySingleton<UserCubit>(() => UserCubit(sl()));
  sl.registerLazySingleton(() => LoginCubit(sl(), sl()));
  sl.registerLazySingleton(() => VisitorsCubit(sl(), sl(), sl()));
  sl.registerLazySingleton(() => DeliveriesCubit(sl(), sl(), sl()));
  sl.registerFactory(() => CreateVisitorPermitCubit(sl()));
  sl.registerFactory(() => CreateDeliveryPermitCubit(sl()));


  //! UseCases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => CreateVisitorPermitUseCase(sl()));
  sl.registerLazySingleton(() => GetActivePermitsUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedVisitorsUseCase(sl()));
  sl.registerLazySingleton(() => DeleteVisitorPermitUseCase(sl()));
  sl.registerLazySingleton(() => CreateDeliveryPermitUseCase(sl()));
  sl.registerLazySingleton(() => GetActiveDeliveriesUseCase(sl()));
  sl.registerLazySingleton(() => GetCachedDeliveriesUseCase(sl()));
  sl.registerLazySingleton(() => DeleteDeliveryPermitUseCase(sl()));


  //! Repos
  sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<PermitsRepo>(() => PermitsRepoImpl(sl(), sl()));
}
