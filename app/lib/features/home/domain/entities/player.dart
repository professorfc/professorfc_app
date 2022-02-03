import 'package:equatable/equatable.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';

class Player extends Equatable {
  const Player({
    required this.name,
    this.photo,
    required this.dx,
    required this.dy,
    required this.position,
  });

  final String name;
  final String? photo;
  final double dx;
  final double dy;
  final PositionEnum position;

  @override
  List<Object?> get props => <Object?>[
        name,
        photo,
        dx,
        dy,
        position,
      ];
}
