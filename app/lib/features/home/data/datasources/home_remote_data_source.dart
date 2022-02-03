import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';

abstract class HomeRemoteDataSource {
  Future<List<PlayerModel>> getPlayers();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.remoteClientRepository);

  final RemoteClientRepository remoteClientRepository;

  @override
  Future<List<PlayerModel>> getPlayers() {
    return Future.value([
      const PlayerModel(
        dx: 120,
        dy: 170,
        name: "Felipe",
        position: PositionEnum.goalkeeper,
      ),
      const PlayerModel(
        dx: 220,
        dy: 250,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 90,
        dy: 80,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 200,
        dy: 20,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 35,
        dy: 100,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 20,
        dy: 150,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 55,
        dy: 180,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 67,
        dy: 270,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 100,
        dy: 20,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 190,
        dy: 46,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
      const PlayerModel(
        dx: 167,
        dy: 5,
        name: "Felipe",
        position: PositionEnum.defender,
      ),
    ]);
  }
}
