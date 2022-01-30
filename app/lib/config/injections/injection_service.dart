import 'package:custom_utilities/custom_utilities.dart';

void registerSingletonServices(GetIt getItInstance) {
  getItInstance.registerLazySingleton<DeviceInfoService>(
    () => DeviceInfoService(),
  );

  getItInstance.registerLazySingleton<LoggerService>(
    () => LoggerService(
      loggerRepository: getItInstance(),
      deviceInfoService: getItInstance(),
    ),
  );
}
