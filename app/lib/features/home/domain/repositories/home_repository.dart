import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';

abstract class HomeRepository {
  Future<Either<List<PlayerModel>, Exception>> getPlayers();
}
