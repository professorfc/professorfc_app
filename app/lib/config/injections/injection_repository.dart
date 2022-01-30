import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:professorfc_app/features/home/domain/repositories/home_repository.dart';

void registerSingletonRepositories(GetIt getItInstance) {
  getItInstance.registerLazySingleton<LoggerRepository>(
    () => LoggerRepository(baseUrl: ''),
  );

  getItInstance.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      remoteDataSource: getItInstance(),
    ),
  );
}
