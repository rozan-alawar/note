import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:note/api/api_services/auth_api.dart';
import 'package:note/api/api_services/dio_client.dart';
import 'package:note/api/api_services/tasks_api.dart';
import 'package:note/services/navigation_service.dart';
import 'package:note/services/snack_bar_service.dart';
import 'package:note/services/storage_services.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<SnackBarSrevie>(() => SnackBarSrevie());
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<DioClient>(DioClient(locator<Dio>()));
  locator.registerSingleton<AuthApi>(AuthApi(locator<DioClient>()));
  locator.registerSingleton<TasksApi>(TasksApi(locator<DioClient>()));
  locator.registerSingleton<Storage>(Storage());
}
