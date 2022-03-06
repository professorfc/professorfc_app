part of '../home_remote_data_source.dart';

mixin AtleticoMineiroTeamMockMixin {
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
      key: "atletico_mineiro",
      id: _ran.nextInt(_base).toString(),
      name: "Atlético Mineiro",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/professorfc-e8eed.appspot.com/o/teams%2Ficons%2Fatletico.png?alt=media&token=b9b8ef47-0f25-471d-8494-9b739268bd96",
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
        name: "Everson",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gabriel Delfim",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Matheus Mendes",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Rafael",
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
        name: "Rever",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 226.2,
        dy: 436.1,
        name: "Nathan",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Diego Godín",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Igor Rabello",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Vitor Mendes",
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
        name: "G. Arana",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 312.3,
        dy: 344.1,
        name: "Guga",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Dodô",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Mariano",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
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
        name: "Keno",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 170.8,
        dy: 299.9,
        name: "Allan",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 313.7,
        dy: 115.2,
        name: "Otávio",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Jair",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "M. Zaracho",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Guilherme Castilho",
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
        name: "Sasha",
        lines: [LineEnum.secondLine, LineEnum.thirdLine],
        positions: [PositionEnum.leftMidfield, PositionEnum.leftAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 160.9,
        dy: 51.4,
        name: "E. Vargas",
        lines: [LineEnum.thirdLine],
        positions: [PositionEnum.centerAttack, PositionEnum.rightAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 227.3,
        dy: 182.7,
        name: "Ademir",
        lines: [LineEnum.thirdLine],
        positions: [PositionEnum.rightAttack, PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Hulk",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Fábio Gomes",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
    ];
  }
}
