import 'package:equatable/equatable.dart';

class Player extends Equatable {
  const Player({
    required this.name,
    this.photo,
    required this.dx,
    required this.dy,
  });

  final String name;
  final String? photo;
  final double dx;
  final double dy;

  @override
  List<Object?> get props => <Object?>[
        name,
        photo,
        dx,
        dy,
      ];
}
