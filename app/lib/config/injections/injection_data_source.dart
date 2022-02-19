import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:professorfc_app/features/search_teams/data/datasources/search_teams_remote_data_source.dart';

void registerSingletonDataSources(GetIt getItInstance) {
  getItInstance.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<SearchTeamsRemoteDataSource>(
      () => SearchTeamsRemoteDataSourceImpl(getItInstance()));
}
