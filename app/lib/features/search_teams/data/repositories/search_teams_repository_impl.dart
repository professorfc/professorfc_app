import 'package:professorfc_app/features/search_teams/data/datasources/search_teams_remote_data_source.dart';
import 'package:professorfc_app/features/search_teams/domain/repositories/search_teams_repository.dart';

class SearchTeamsRepositoryImpl implements SearchTeamsRepository {
  SearchTeamsRepositoryImpl({
    required this.remoteDataSource,
  });

  final SearchTeamsRemoteDataSource remoteDataSource;
}
