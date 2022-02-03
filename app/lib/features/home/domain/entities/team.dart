import 'package:professorfc_app/features/home/domain/entities/coach.dart';
import 'package:professorfc_app/features/home/domain/entities/player.dart';

class Team {
  final List<Player> holders;
  final List<Player> reservers;
  final Coach coach;
  final int formation;

  const Team({
    required this.holders,
    required this.reservers,
    required this.coach,
    required this.formation,
  });
}
