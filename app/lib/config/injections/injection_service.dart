import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/config/analytics_service.dart';

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

  getItInstance.registerLazySingleton<AnalyticsService>(
    () => AnalyticsService(),
  );
}
