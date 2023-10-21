import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inventarioapp/Core/Network/dio.dart';
import 'package:inventarioapp/Features/Auth/Application/IRepositories/auth_irepository.dart';
import 'package:inventarioapp/Features/Auth/Application/Services/auth_service.dart';
import 'package:inventarioapp/Features/Auth/Domain/Repositories/auth_repository.dart';

GetIt getIt = GetIt.instance;

void dependencyInjection() {
  //Dio
  getIt.registerLazySingleton<Dio>(
    () => DioClient.dio,
  );

  //Services
  getIt.registerLazySingleton(
    () => AuthService(getIt.get()),
  );

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthIRepository(getIt.get()),
  );
}
