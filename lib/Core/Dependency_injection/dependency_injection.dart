import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inventarioapp/Core/Network/dio.dart';
import 'package:inventarioapp/Features/Auth/Application/Bloc/login_bloc/login_bloc.dart';
import 'package:inventarioapp/Features/Auth/Application/IRepositories/auth_irepository.dart';
import 'package:inventarioapp/Features/Auth/Application/Services/auth_service.dart';
import 'package:inventarioapp/Features/Auth/Domain/Repositories/auth_repository.dart';
import 'package:inventarioapp/Features/Main/Application/Blocs/Main_bloc/main_bloc.dart';
import 'package:inventarioapp/Features/User/Application/Blocs/user_bloc/user_bloc.dart';
import 'package:inventarioapp/Features/User/Application/IRepositories/user_irepository.dart';
import 'package:inventarioapp/Features/User/Application/Services/user_services.dart';
import 'package:inventarioapp/Features/User/Domain/Repositories/user_repository.dart';

GetIt getIt = GetIt.instance;

void dependencyInjection() {
  //Dio
  getIt.registerLazySingleton<Dio>(
    () => DioClient.dio,
  );

  //Blocs
  getIt.registerLazySingleton(
    () => LoginBloc(getIt.get()),
  );
  getIt.registerLazySingleton(
    () => MainBloc(),
  );
  getIt.registerLazySingleton(
    () => UserBloc(getIt.get()),
  );
  //Services
  getIt.registerLazySingleton(
    () => AuthService(getIt.get()),
  );
  getIt.registerLazySingleton(
    () => UserServices(getIt.get()),
  );

  //Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthIRepository(getIt.get()),
  );
  getIt.registerLazySingleton<UserRepository>(
    () => UserIRepository(getIt.get()),
  );
}
