import 'package:equatable/equatable.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';

class Player extends Equatable {
  Player({
    required this.id,
    required this.name,
    this.photo,
    required this.dx,
    required this.dy,
    required this.lines,
    required this.startingPlayer,
    required this.positions,
  });

  final String id;
  final String name;
  final String? photo;
  double dx;
  double dy;
  final List<LineEnum> lines;
  final bool startingPlayer;
  final List<PositionEnum> positions;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        photo,
        dx,
        dy,
        lines,
        startingPlayer,
        positions,
      ];
}
