import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/datasources/home_remote_data_source.dart';

void registerSingletonDataSources(GetIt getItInstance) {
  getItInstance.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getItInstance()));
}
