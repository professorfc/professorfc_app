part of '../home_remote_data_source.dart';

mixin CorithiansTeamMockMixin {
  Future<TeamModel> getTeamFromModel() {
    var _allPlayers = <PlayerModel>[];

    _allPlayers.addAll(_getGoalkeeper());
    _allPlayers.addAll(_getDefender());
    _allPlayers.addAll(_getSide());
    _allPlayers.addAll(_getMidfields());
    _allPlayers.addAll(_getAttacks());

    int _base = 100000;
    Random _ran = Random();
    TeamModel model = TeamModel(
      key: "corinthians",
      id: _ran.nextInt(_base).toString(),
      name: "Corinthians",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/professorfc-e8eed.appspot.com/o/teams%2Ficons%2Fcorinthians.png?alt=media&token=6a88e476-8bd8-48a7-a925-133e42333dfe",
      holders: _allPlayers.where((element) => element.startingPlayer).toList(),
      reservers:
          _allPlayers.where((element) => !element.startingPlayer).toList(),
      coach: const CoachModel(
        age: 40,
        name: 'Fernando Lázaro',
      ),
      formation: 442,
    );

    return Future.value(model);
  }

  List<PlayerModel> _getGoalkeeper() {
    int _base = 100000;
    Random _ran = Random();

    return [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 159.6,
        dy: 523.8,
        name: "Cássio",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Carlos Miguel",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Guilherme",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Mateus Donelli",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
    ];
  }

  List<PlayerModel> _getDefender() {
    int _base = 100000;
    Random _ran = Random();

    return [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 105.2,
        dy: 438.1,
        name: "Gil",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 226.2,
        dy: 436.1,
        name: "João Vitor",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Danilo Avelar",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Robson Bambu",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Raul Gustavo",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
    ];
  }

  List<PlayerModel> _getSide() {
    int _base = 100000;
    Random _ran = Random();

    return [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 30.4,
        dy: 345.7,
        name: "Fábio Santos",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 312.3,
        dy: 344.1,
        name: "Fagner",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Bruno Melo",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "João Pedro",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Lucas Piton",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
    ];
  }

  List<PlayerModel> _getMidfields() {
    int _base = 100000;
    Random _ran = Random();

    return [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 99.2,
        dy: 185.8,
        name: "Renato Augusto",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 170.8,
        dy: 299.9,
        name: "Giuliano",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 227.3,
        dy: 182.7,
        name: "Paulinho",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender, PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 313.7,
        dy: 115.2,
        name: "Willian",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Adson",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Cantillo",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Du Queiroz",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Luan",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gabriel Pereira",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gustavo Mantuan",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Roni",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Ruan Oliveira",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Xavier",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
    ];
  }

  List<PlayerModel> _getAttacks() {
    int _base = 100000;
    Random _ran = Random();

    return [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 17.4,
        dy: 112.2,
        name: "Roger Guedes",
        lines: [LineEnum.secondLine, LineEnum.thirdLine],
        positions: [PositionEnum.leftMidfield, PositionEnum.leftAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 160.9,
        dy: 51.4,
        name: "Jô",
        lines: [LineEnum.thirdLine],
        positions: [PositionEnum.centerAttack, PositionEnum.rightAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gustavo Silva",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
    ];
  }
}
