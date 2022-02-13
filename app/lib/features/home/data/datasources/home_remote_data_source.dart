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

    var _allPlayers = [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 159.6,
        dy: 523.8,
        name: "Cássio",
        positions: [PositionEnum.goalkeeper],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 105.2,
        dy: 438.1,
        name: "Gil",
        positions: [PositionEnum.firstLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 226.2,
        dy: 436.1,
        name: "João Vitor",
        positions: [PositionEnum.firstLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 30.4,
        dy: 345.7,
        name: "Fábio Santos",
        positions: [PositionEnum.firstLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 312.3,
        dy: 344.1,
        name: "Fagner",
        positions: [PositionEnum.firstLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 99.2,
        dy: 185.8,
        name: "Renato Augusto",
        positions: [PositionEnum.secondLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 170.8,
        dy: 299.9,
        name: "Giuliano",
        positions: [PositionEnum.secondLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 227.3,
        dy: 182.7,
        name: "Paulinho",
        positions: [PositionEnum.secondLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 313.7,
        dy: 115.2,
        name: "William",
        positions: [PositionEnum.secondLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 17.4,
        dy: 112.2,
        name: "Roger Guedes",
        positions: [PositionEnum.secondLine, PositionEnum.thirdLine],
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 160.9,
        dy: 51.4,
        name: "Jô",
        positions: [PositionEnum.thirdLine],
        startingPlayer: true,
      ),
    ];

    _allPlayers.addAll(_getReservePlayers());

    _allPlayers.sort((a, b) => a.name.compareTo(b.name));

    return Future.value(_allPlayers);
  }

  List<PlayerModel> _getReservePlayers() {
    int _base = 100000;
    Random _ran = Random();
    return [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Carlos Miguel",
        positions: [PositionEnum.goalkeeper],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Guilherme",
        positions: [PositionEnum.goalkeeper],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Mateus Donelli",
        positions: [PositionEnum.goalkeeper],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Danilo Avelar",
        positions: [PositionEnum.firstLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Robson Bambu",
        positions: [PositionEnum.firstLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Raul Gustavo",
        positions: [PositionEnum.firstLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Bruno Melo",
        positions: [PositionEnum.firstLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "João Pedro",
        positions: [PositionEnum.firstLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Lucas Piton",
        positions: [PositionEnum.firstLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Adson",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Cantillo",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Du Queiroz",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gabriel",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Luan",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gabriel Pereira",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gustavo Mantuan",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Roni",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Ruan Oliveira",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Xavier",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gustavo Silva",
        positions: [PositionEnum.secondLine],
        startingPlayer: false,
      ),
    ];
  }
}
