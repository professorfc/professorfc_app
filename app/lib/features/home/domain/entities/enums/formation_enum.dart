import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';

class FormationEnum {
  static Map<int, String> get formations => {
        442: "4-4-2",
        352: "3-5-2",
      };
}

class FormationPositionsEnum {
  static Map<int, Map<PositionEnum, List<PositionPlayer>>> get formations => {
        442: {
          PositionEnum.defender: [
            PositionPlayer(dx: 12, dy: 15),
            PositionPlayer(dx: 12, dy: 15),
          ],
          PositionEnum.side: [
            PositionPlayer(dx: 12, dy: 15),
            PositionPlayer(dx: 12, dy: 15),
          ],
          PositionEnum.midfield: [
            PositionPlayer(dx: 12, dy: 15),
            PositionPlayer(dx: 12, dy: 15),
            PositionPlayer(dx: 12, dy: 15),
            PositionPlayer(dx: 12, dy: 15),
          ],
          PositionEnum.attacker: [
            PositionPlayer(dx: 12, dy: 15),
            PositionPlayer(dx: 12, dy: 15),
          ],
        }
      };
}

class PositionPlayer {
  final double dx;
  final double dy;

  PositionPlayer({
    required this.dx,
    required this.dy,
  });
}
