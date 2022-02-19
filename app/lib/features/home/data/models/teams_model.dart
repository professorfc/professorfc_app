import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';

class TeamsModel extends Equatable {
  const TeamsModel({
    required this.teams,
  });

  final List<TeamModel> teams;

  factory TeamsModel.fromJson(Map<String, dynamic> json) {
    return TeamsModel(
      teams: json['teams'] != null
          ? (json['teams'] as List).map((e) => TeamModel.fromJson(e)).toList()
          : [],
    );
  }

  @override
  String toString() {
    return '''
    ''';
  }

  Map<String, dynamic> toJson() {
    return {
      'teams': teams.map((e) => (e as TeamsModel).toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        teams,
      ];
}
