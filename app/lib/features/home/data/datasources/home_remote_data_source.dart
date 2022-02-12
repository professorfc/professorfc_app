import 'dart:math';

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
    int _base = 100000;
    Random _ran = Random();
    return Future.value([
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 159.6,
        dy: 523.8,
        name: "Cássio",
        positions: [PositionEnum.goalkeeper],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 105.2,
        dy: 438.1,
        name: "Gil",
        positions: [PositionEnum.firstLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 226.2,
        dy: 436.1,
        name: "João Vitor",
        positions: [PositionEnum.firstLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 30.4,
        dy: 345.7,
        name: "Fábio Santos",
        positions: [PositionEnum.firstLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 312.3,
        dy: 344.1,
        name: "Fagner",
        positions: [PositionEnum.firstLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 99.2,
        dy: 185.8,
        name: "Renato Augusto",
        positions: [PositionEnum.secondLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 170.8,
        dy: 299.9,
        name: "Giuliano",
        positions: [PositionEnum.secondLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 227.3,
        dy: 182.7,
        name: "Paulinho",
        positions: [PositionEnum.secondLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 313.7,
        dy: 115.2,
        name: "William",
        positions: [PositionEnum.secondLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 17.4,
        dy: 112.2,
        name: "Roger Guedes",
        positions: [PositionEnum.secondLine, PositionEnum.thirdLine],
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 160.9,
        dy: 51.4,
        name: "Jô",
        positions: [PositionEnum.thirdLine],
      ),
    ]);
  }
}
