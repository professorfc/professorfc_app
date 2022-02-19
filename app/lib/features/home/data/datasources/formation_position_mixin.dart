part of './home_remote_data_source.dart';

mixin FormationPositionMixin {
  Future<List<FormationPositionModel>> getFormationsFromModel() {
    int _base = 100000;
    Random _ran = Random();

    var _result = [
      FormationPositionModel(
        id: _ran.nextInt(_base).toString(),
        formation: 352,
        formationLabel: "3-5-2",
        positionPlayers: [
          PositionPlayerModel(LineEnum.zeroLine, PositionEnum.goalkeeper,
              dx: 159.6, dy: 523.8),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.leftDefender,
              dx: 76.2, dy: 436.6),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.rightDefender,
              dx: 258.9, dy: 434.9),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.centerDefender,
              dx: 164.8, dy: 437.8),
          PositionPlayerModel(
              LineEnum.secondLine, PositionEnum.midfieldDefender,
              dx: 98.7, dy: 304.8),
          PositionPlayerModel(
              LineEnum.secondLine, PositionEnum.midfieldDefender,
              dx: 230.3, dy: 303.4),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.centerMidfield,
              dx: 163.8, dy: 165.1),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.rightMidfield,
              dx: 303.0, dy: 207.0),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.leftMidfield,
              dx: 21.9, dy: 197.1),
          PositionPlayerModel(LineEnum.thirdLine, PositionEnum.leftAttack,
              dx: 98.5, dy: 86.2),
          PositionPlayerModel(LineEnum.thirdLine, PositionEnum.rightAttack,
              dx: 213.1, dy: 86.0),
        ],
      ),
      FormationPositionModel(
        id: _ran.nextInt(_base).toString(),
        formation: 4141,
        formationLabel: "4-1-4-1",
        positionPlayers: [
          PositionPlayerModel(LineEnum.zeroLine, PositionEnum.goalkeeper,
              dx: 159.6, dy: 523.8),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.leftDefender,
              dx: 105.2, dy: 438.1),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.rightDefender,
              dx: 226.2, dy: 436.1),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.leftSide,
              dx: 30.4, dy: 345.7),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.rightSide,
              dx: 312.3, dy: 344.1),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.centerMidfield,
              dx: 99.2, dy: 185.8),
          PositionPlayerModel(
              LineEnum.secondLine, PositionEnum.midfieldDefender,
              dx: 170.8, dy: 299.9),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.centerMidfield,
              dx: 227.3, dy: 182.7),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.rightMidfield,
              dx: 313.7, dy: 115.2),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.leftMidfield,
              dx: 17.4, dy: 112.2),
          PositionPlayerModel(LineEnum.thirdLine, PositionEnum.centerAttack,
              dx: 160.9, dy: 51.4),
        ],
      ),
      FormationPositionModel(
        id: _ran.nextInt(_base).toString(),
        formation: 4231,
        formationLabel: "4-2-3-1",
        positionPlayers: [
          PositionPlayerModel(LineEnum.zeroLine, PositionEnum.goalkeeper,
              dx: 159.6, dy: 523.8),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.leftDefender,
              dx: 105.2, dy: 438.1),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.rightDefender,
              dx: 226.2, dy: 436.1),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.leftSide,
              dx: 30.4, dy: 345.7),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.rightSide,
              dx: 312.3, dy: 344.1),
          PositionPlayerModel(
              LineEnum.secondLine, PositionEnum.midfieldDefender,
              dx: 86.6, dy: 269.0),
          PositionPlayerModel(
              LineEnum.secondLine, PositionEnum.midfieldDefender,
              dx: 238.7, dy: 261.9),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.centerMidfield,
              dx: 161.2, dy: 168.2),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.rightMidfield,
              dx: 313.7, dy: 115.2),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.leftMidfield,
              dx: 17.4, dy: 112.2),
          PositionPlayerModel(LineEnum.thirdLine, PositionEnum.centerAttack,
              dx: 160.9, dy: 51.4),
        ],
      ),
      FormationPositionModel(
        id: _ran.nextInt(_base).toString(),
        formation: 442,
        formationLabel: "4-4-2",
        positionPlayers: [
          PositionPlayerModel(LineEnum.zeroLine, PositionEnum.goalkeeper,
              dx: 159.6, dy: 523.8),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.leftDefender,
              dx: 105.2, dy: 438.1),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.rightDefender,
              dx: 226.2, dy: 436.1),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.leftSide,
              dx: 19.7, dy: 376.5),
          PositionPlayerModel(LineEnum.firstLine, PositionEnum.rightSide,
              dx: 316.1, dy: 379.9),
          PositionPlayerModel(
              LineEnum.secondLine, PositionEnum.midfieldDefender,
              dx: 93.1, dy: 297.7),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.leftMidfield,
              dx: 15.7, dy: 189.0),
          PositionPlayerModel(
              LineEnum.secondLine, PositionEnum.midfieldDefender,
              dx: 227.6, dy: 293.5),
          PositionPlayerModel(LineEnum.secondLine, PositionEnum.rightMidfield,
              dx: 307.9, dy: 189.4),
          PositionPlayerModel(LineEnum.thirdLine, PositionEnum.leftAttack,
              dx: 106.5, dy: 94.6),
          PositionPlayerModel(LineEnum.thirdLine, PositionEnum.rightAttack,
              dx: 213.4, dy: 102.8),
        ],
      ),
    ];
    return Future.value(_result);
  }
}
