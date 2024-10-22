import 'package:get_it/get_it.dart';
import 'package:inventarioapp/Features/Auth/Application/Repositories/auth_irepository.dart';
import 'package:inventarioapp/Features/Auth/Application/Services/auth_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<AuthIRepository>(
    AuthIRepository(getIt<AuthService>()),
  );
}
