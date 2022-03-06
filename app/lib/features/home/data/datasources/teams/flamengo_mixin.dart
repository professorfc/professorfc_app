part of '../home_remote_data_source.dart';

mixin FlamengoTeamMockMixin {
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
      key: "flamengo",
      id: _ran.nextInt(_base).toString(),
      name: "Flamengo",
      icon:
          "https://firebasestorage.googleapis.com/v0/b/professorfc-e8eed.appspot.com/o/teams%2Ficons%2Ffla.png?alt=media&token=8e997065-db8b-4a53-aee8-447d3644dfc3",
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
        name: "Hugo Souza",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Diego Alves",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Matheus Cunha",
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
        name: "D. Luiz",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Fabricio Bruno",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Rodrigo Caio",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gustavo Henrique",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Léo Pereira",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Noga",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Cleiton",
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
        dx: 226.2,
        dy: 436.1,
        name: "F. Luis",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 312.3,
        dy: 344.1,
        name: "Rodinei",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Isla",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Matheuzinho",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Renê",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Ramon",
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
        dx: 30.4,
        dy: 345.7,
        name: "E. Ribeiro",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 99.2,
        dy: 185.8,
        name: "Gomez",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 170.8,
        dy: 299.9,
        name: "Arão",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 227.3,
        dy: 182.7,
        name: "B. Henrique",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender, PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 313.7,
        dy: 115.2,
        name: "G. de Arrascaeta",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Andreas",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Thiago Maia",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "João Gomes",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Diego",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Lázaro",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Matheus França",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield],
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
        name: "Vitinho",
        lines: [LineEnum.secondLine, LineEnum.thirdLine],
        positions: [PositionEnum.leftMidfield, PositionEnum.leftAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 160.9,
        dy: 51.4,
        name: "Gabriel",
        lines: [LineEnum.thirdLine],
        positions: [PositionEnum.centerAttack, PositionEnum.rightAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Pedro",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Marinho",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
    ];
  }
}
