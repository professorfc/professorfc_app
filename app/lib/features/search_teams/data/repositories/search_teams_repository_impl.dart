import 'package:professorfc_app/features/home/data/models/teams_model.dart';
import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/search_teams/data/datasources/search_teams_remote_data_source.dart';
import 'package:professorfc_app/features/search_teams/domain/repositories/search_teams_repository.dart';

class SearchTeamsRepositoryImpl implements SearchTeamsRepository {
  SearchTeamsRepositoryImpl({
    required this.remoteDataSource,
  });

  final SearchTeamsRemoteDataSource remoteDataSource;

  @override
  Future<Either<TeamsModel, Exception>> getTeams() async {
    try {
      var response = await remoteDataSource.getTeams();
      return Left<TeamsModel, Exception>(response);
    } on dynamic catch (e) {
      return Right<TeamsModel, Exception>(e);
    }
  }
}
