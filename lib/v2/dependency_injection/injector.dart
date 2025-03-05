import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inventarioapp/Features/Home/Application/Repositories/home_irepository.dart';
import 'package:inventarioapp/Features/Home/Application/Services/home_service.dart';
import 'package:inventarioapp/Features/Main/Application/Repositories/main_irepository.dart';
import 'package:inventarioapp/Features/Main/Application/Services/main_service.dart';
import 'package:inventarioapp/v2/data/repositories/auth_irepository.dart';
import 'package:inventarioapp/v2/data/services/auth_service.dart';
import 'package:inventarioapp/v2/ui/utils/const.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: BASE_URL),
    ),
  );

  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<AuthIRepository>(
    AuthIRepository(getIt<AuthService>()),
  );
  getIt.registerSingleton<MainService>(MainService());
  getIt.registerSingleton<MainIRepository>(
    MainIRepository(getIt<MainService>()),
  );
  getIt.registerSingleton<HomeService>(HomeService());
  getIt.registerSingleton<HomeIRepository>(
    HomeIRepository(getIt<HomeService>()),
  );
}
