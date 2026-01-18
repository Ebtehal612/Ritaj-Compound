import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:ritaj_compound/app/route_manager/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/localization/localization_manager.dart';
import '../../core/shared_preferences/shared_prefs.dart';
import '../../core/theme/app_theme.dart';


final sl = GetIt.instance;

Future<void> init() async {
// cubits
 // sl.registerLazySingleton(() => LoginCubit(sl(), sl()));
  

  //! useCases

  //sl.registerLazySingleton(() => LoginUseCase(sl()));
 

  //! repos
  //sl.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()));
  
  //! data sources
  //sl.registerLazySingleton<AuthRemoteDataSource>(
   //   () => AuthRemoteDataSourceImpl(sl()));
  

  // core
  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => const FlutterSecureStorage());

  // core
  sl.registerLazySingleton<SharedPrefs>(() => SharedPrefs(sl(), sl()));
  sl.registerLazySingleton<AppTheme>(() => AppTheme());
  sl.registerLazySingleton(() => AppRouter());
  sl.registerLazySingleton<LocaleCubit>(() => LocaleCubit());
}
