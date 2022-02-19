import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/models/teams_model.dart';

abstract class SearchTeamsRepository {
  Future<Either<TeamsModel, Exception>> getTeams();
}
