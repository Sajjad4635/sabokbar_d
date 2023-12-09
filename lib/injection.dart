import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sabokbar_d/core/local_storage/local_data.dart';
import 'package:sabokbar_d/core/network/chopper_api.dart';
import 'package:sabokbar_d/core/network/network_info.dart';
import 'package:sabokbar_d/features/login/data/data_sources/login_api.dart';
import 'package:sabokbar_d/features/login/data/repositories/login_repository_impl.dart';
import 'package:sabokbar_d/features/login/domain/repositories/login_repository.dart';
import 'package:sabokbar_d/features/login/domain/use_cases/send_otp_use_case.dart';
import 'package:sabokbar_d/features/login/presentation/manager/login_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/splash/data/repositories/splash_repository_impl.dart';
import 'features/splash/domain/use_cases/get_token.dart';

final serviceLocator = GetIt.instance;

Future init() async {
  // ///feature splash
  // ///bloc
  // serviceLocator.registerFactory(
  //       () => SplashBloc(
  //       getSetting: serviceLocator(),
  //       getToken: serviceLocator(),
  //       getUser: serviceLocator()),
  // );
  //
  // ///use cases
  // serviceLocator.registerLazySingleton(() => GetSetting(serviceLocator()));
  // serviceLocator.registerLazySingleton(() => GetToken(serviceLocator()));
  // serviceLocator.registerLazySingleton(() => GetUser(serviceLocator()));
  //
  // ///repository
  //
  // serviceLocator.registerLazySingleton<SplashRepository>(() =>
  //     SplashRepositoryImpl(
  //         splashData: serviceLocator(), networkInfo: serviceLocator()));
  //
  // ///data sources
  //
  // serviceLocator.registerLazySingleton<SplashData>(() => SplashDataImpl(
  //     localData: serviceLocator(), chopperAPI: serviceLocator()));
  //
  ///feature login
  ///bloc
  serviceLocator.registerFactory(
        () => LoginBloc(sendOtpUseCase: serviceLocator()),
  );

  ///usecases

  serviceLocator.registerLazySingleton(() => SendOtpUseCase(serviceLocator()));

  ///repository

  serviceLocator.registerLazySingleton<LoginRepository>(() =>
      LoginRepositoryImpl(
          loginApi: serviceLocator(), networkInfo: serviceLocator()));

  ///data sources
  serviceLocator
      .registerLazySingleton<LoginApi>(() => LoginApiImpl(localData: serviceLocator(), chopperAPI: serviceLocator(),));

  serviceLocator.registerLazySingleton<LocalData>(
          () => LocalDataImpl(storage: serviceLocator()));

  ///third parties and cores
  serviceLocator.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(serviceLocator()));
  final InternetConnectionChecker checker =
  InternetConnectionChecker.createInstance(addresses: [
    AddressCheckOptions(
        address: InternetAddress(
          '31.7.70.77',
          type: InternetAddressType.IPv4,
        ),
        port: 80)
  ]);
  serviceLocator.registerLazySingleton(() => checker);
  final ChopperAPI chopperAPI = ChopperAPI.create();
  serviceLocator.registerLazySingleton(() => chopperAPI);

  final storage = await SharedPreferences.getInstance();

  serviceLocator.registerLazySingleton(() => storage);
}
