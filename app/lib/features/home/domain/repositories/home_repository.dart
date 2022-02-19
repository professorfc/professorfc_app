import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/models/formation_position_model.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';

abstract class HomeRepository {
  Future<Either<TeamModel?, Exception>> getTeam();
  Future<Either<void, Exception>> setTeam(String key);
  Future<Either<List<FormationPositionModel>, Exception>> getFormations();
}
