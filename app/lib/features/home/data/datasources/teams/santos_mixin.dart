part of '../home_remote_data_source.dart';

mixin SantosTeamMockMixin {
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
      name: "Santos",
      icon: "https://www.escudosfc.com.br/images/santos.png",
      holders: _allPlayers.where((element) => element.startingPlayer).toList(),
      reservers:
          _allPlayers.where((element) => !element.startingPlayer).toList(),
      coach: const CoachModel(
        age: 40,
        name: 'Fábio Carille',
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
        name: "João paulo",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Diógenes",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Paulo Mazoti",
        lines: [LineEnum.zeroLine],
        positions: [PositionEnum.goalkeeper],
        positionGroup: PositionGroupEnum.goalkeepers,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "John",
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
        name: "Velázquez",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 226.2,
        dy: 436.1,
        name: "Kaiky",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Bauermann",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Derick",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Robson Reis",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftDefender],
        positionGroup: PositionGroupEnum.defenders,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Luiz Felipe",
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
        name: "Lucas Pires",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.leftSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 312.3,
        dy: 344.1,
        name: "Madson",
        lines: [LineEnum.firstLine],
        positions: [PositionEnum.rightSide],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 170.8,
        dy: 299.9,
        name: "Felipe Jonatan",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightSide, PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.siders,
        startingPlayer: true,
      ),
    ];
  }

  List<PlayerModel> _getMidfields() {
    int _base = 100000;
    Random _ran = Random();

    return [
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 227.3,
        dy: 182.7,
        name: "Vinicius Balieiro",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender, PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 313.7,
        dy: 115.2,
        name: "Marcos Guilherme",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.leftMidfield, PositionEnum.leftAttack],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 99.2,
        dy: 185.8,
        name: "Ângelo",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield, PositionEnum.rightAttack],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Luiz Henrique",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Ricardo Goulart",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Bruno Oliveira",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.centerMidfield],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Augusto",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Camacho",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Vinícius Zanocelo",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Kevin Malthus",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Gabriel Pirani",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Ivonei",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Jobson",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Sandry",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Carlos Sanchez",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.midfieldDefender],
        positionGroup: PositionGroupEnum.midfields,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Lucas Barbosa",
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
        name: "Marcos Leonardo",
        lines: [LineEnum.secondLine, LineEnum.thirdLine],
        positions: [PositionEnum.leftAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 160.9,
        dy: 51.4,
        name: "Léo Baptistão",
        lines: [LineEnum.thirdLine],
        positions: [PositionEnum.centerAttack, PositionEnum.rightAttack],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: true,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Rwan",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Allanzinho",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Lucas Braga",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
      PlayerModel(
        id: _ran.nextInt(_base).toString(),
        dx: 0,
        dy: 0,
        name: "Tailson",
        lines: [LineEnum.secondLine],
        positions: [PositionEnum.rightMidfield],
        positionGroup: PositionGroupEnum.attacks,
        startingPlayer: false,
      ),
    ];
  }
}
