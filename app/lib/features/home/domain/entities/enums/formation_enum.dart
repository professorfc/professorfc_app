import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';

class FormationEnum {
  static Map<int, String> get formations => {
        442: "4-4-2",
        4231: "4-2-3-1",
        4141: "4-1-4-1",
      };
}

class FormationPositionsEnum {
  static Map<int, List<PositionPlayer>> get formations => {
        4141: [
          PositionPlayer(PositionEnum.goalkeeper, dx: 159.6, dy: 523.8),
          PositionPlayer(PositionEnum.firstLine, dx: 105.2, dy: 438.1),
          PositionPlayer(PositionEnum.firstLine, dx: 226.2, dy: 436.1),
          PositionPlayer(PositionEnum.firstLine, dx: 30.4, dy: 345.7),
          PositionPlayer(PositionEnum.firstLine, dx: 312.3, dy: 344.1),
          PositionPlayer(PositionEnum.secondLine, dx: 99.2, dy: 185.8),
          PositionPlayer(PositionEnum.secondLine, dx: 170.8, dy: 299.9),
          PositionPlayer(PositionEnum.secondLine, dx: 227.3, dy: 182.7),
          PositionPlayer(PositionEnum.secondLine, dx: 313.7, dy: 115.2),
          PositionPlayer(PositionEnum.secondLine, dx: 17.4, dy: 112.2),
          PositionPlayer(PositionEnum.thirdLine, dx: 160.9, dy: 51.4),
        ],
        4231: [
          PositionPlayer(PositionEnum.goalkeeper, dx: 159.6, dy: 523.8),
          PositionPlayer(PositionEnum.firstLine, dx: 105.2, dy: 438.1),
          PositionPlayer(PositionEnum.firstLine, dx: 226.2, dy: 436.1),
          PositionPlayer(PositionEnum.firstLine, dx: 30.4, dy: 345.7),
          PositionPlayer(PositionEnum.firstLine, dx: 312.3, dy: 344.1),
          PositionPlayer(PositionEnum.secondLine, dx: 161.2, dy: 168.2),
          PositionPlayer(PositionEnum.secondLine, dx: 86.6, dy: 269.0),
          PositionPlayer(PositionEnum.secondLine, dx: 238.7, dy: 261.9),
          PositionPlayer(PositionEnum.secondLine, dx: 313.7, dy: 115.2),
          PositionPlayer(PositionEnum.secondLine, dx: 17.4, dy: 112.2),
          PositionPlayer(PositionEnum.thirdLine, dx: 160.9, dy: 51.4),
        ],
        442: [
          PositionPlayer(PositionEnum.goalkeeper, dx: 159.6, dy: 523.8),
          PositionPlayer(PositionEnum.firstLine, dx: 105.2, dy: 438.1),
          PositionPlayer(PositionEnum.firstLine, dx: 226.2, dy: 436.1),
          PositionPlayer(PositionEnum.firstLine, dx: 19.7, dy: 376.5),
          PositionPlayer(PositionEnum.firstLine, dx: 316.1, dy: 379.9),
          PositionPlayer(PositionEnum.secondLine, dx: 93.1, dy: 297.7),
          PositionPlayer(PositionEnum.secondLine, dx: 15.7, dy: 189.0),
          PositionPlayer(PositionEnum.secondLine, dx: 227.6, dy: 293.5),
          PositionPlayer(PositionEnum.secondLine, dx: 307.9, dy: 189.4),
          PositionPlayer(PositionEnum.thirdLine, dx: 106.5, dy: 94.6),
          PositionPlayer(PositionEnum.thirdLine, dx: 213.4, dy: 102.8),
        ]
      };
}

class PositionPlayer {
  final double dx;
  final double dy;
  final PositionEnum position;

  PositionPlayer(this.position, {required this.dx, required this.dy});
}
