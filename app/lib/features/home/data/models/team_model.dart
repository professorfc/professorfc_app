import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/coach_model.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';

class TeamModel extends Equatable {
  const TeamModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.holders,
    required this.reservers,
    required this.coach,
    required this.formation,
  });

  final String id;
  final String name;
  final String icon;
  final List<PlayerModel> holders;
  final List<PlayerModel> reservers;
  final CoachModel coach;
  final int formation;

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      id: json['id'],
      icon: json['icon'],
      name: json['name'],
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
      'id': id,
      'name': name,
      'icon': icon,
      'holders': holders.map((e) => (e as PlayerModel).toJson()).toList(),
      'reservers': reservers.map((e) => (e as PlayerModel).toJson()).toList(),
      'coach': (coach as CoachModel).toJson(),
      'formation': formation,
    };
  }

  @override
  List<Object?> get props => [];
}
