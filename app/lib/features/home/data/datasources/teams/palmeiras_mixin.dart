part of '../home_remote_data_source.dart';

mixin PalmeirasTeamMockMixin {
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
      id: _ran.nextInt(_base).toString(),
      name: "Palmeiras",
      icon: "https://www.escudosfc.com.br/images/palmeiras.png",
      holders: _allPlayers.where((element) => element.startingPlayer).toList(),
      reservers:
          _allPlayers.where((element) => !element.startingPlayer).toList(),
      coach: const CoachModel(
        age: 40,
        name: 'Abel Ferreira',
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
        name: "Weverton",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Marcelo Lomba",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Vinicius",
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
        name: "Gustavo Gómez",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 226.2,
        dy: 436.1,
        name: "Luan",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Benjamín Kuscevic",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Murilo",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Renan",
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
        name: "Joaquín Piquerez",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 312.3,
        dy: 344.1,
        name: "Marcos Rocha",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Mayke",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Jorge",
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
        name: "Raphael Veiga",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 170.8,
        dy: 299.9,
        name: "Zé Rafael",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 227.3,
        dy: 182.7,
        name: "Danilo",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender, PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 313.7,
        dy: 115.2,
        name: "Gustavo Scarpa",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gabriel Menino",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Eduard Atuesta",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Patrick de Paula",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Jailson",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
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
        name: "Dudu",
        lines: [LineEnum.secondLine, LineEnum.thirdLine],
        positions: [PositionEnum.leftAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 160.9,
        dy: 51.4,
        name: "Rony",
        lines: [LineEnum.thirdLine],
        positions: [PositionEnum.centerAttack, PositionEnum.rightAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Deyverson",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Breno Lopes",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gabriel Veron",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Luan Silva",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Rafael Navarro",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Wesley",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
    ];
  }
}
