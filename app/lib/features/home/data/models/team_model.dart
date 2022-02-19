import 'package:professorfc_app/features/home/data/models/coach_model.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/domain/entities/team.dart';

class TeamModel extends Team {
  const TeamModel({
    required List<PlayerModel> holders,
    required List<PlayerModel> reservers,
    required CoachModel coach,
    required int formation,
  }) : super(
          holders: holders,
          reservers: reservers,
          coach: coach,
          formation: formation,
        );

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      holders: json['holders'] != null
          ? (json['holders'] as List)
              .map((e) => PlayerModel.fromJson(e))
              .toList()
          : [],
      reservers: json['reservers'] != null
          ? (json['reservers'] as List)
              .map((e) => PlayerModel.fromJson(e))
              .toList()
          : [],
      coach: CoachModel.fromJson(json['coach']),
      formation: json['formation'],
    );
  }

  @override
  String toString() {
    return '''
    ''';
  }

  Map<String, dynamic> toJson() {
    return {
      'holders': holders.map((e) => (e as PlayerModel).toJson()).toList(),
      'reservers': reservers.map((e) => (e as PlayerModel).toJson()).toList(),
      'coach': (coach as CoachModel).toJson(),
      'formation': formation,
    };
  }
}
