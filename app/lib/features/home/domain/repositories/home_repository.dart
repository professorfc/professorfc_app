import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';

abstract class HomeRepository {
  Future<Either<TeamModel, Exception>> getTeam();
  Future<Either<List<int>, Exception>> getFormations();
}
