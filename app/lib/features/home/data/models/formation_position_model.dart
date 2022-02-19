import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/position_player_model.dart';

class FormationPositionModel extends Equatable {
  const FormationPositionModel({
    required this.id,
    required this.formation,
    required this.formationLabel,
    required this.positionPlayers,
  });

  final String id;
  final int formation;
  final String formationLabel;
  final List<PositionPlayerModel> positionPlayers;

  factory FormationPositionModel.fromJson(Map<String, dynamic> json) {
    return FormationPositionModel(
      id: json['id'],
      formation: json['formation'],
      formationLabel: json['formationLabel'],
      positionPlayers: List<PositionPlayerModel>.from(
        json['positionPlayers'].map(
          (e) => PositionPlayerModel.fromJson(e),
        ),
      ),
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
      'formation': formation,
      'formationLabel': formationLabel,
      'positionPlayers': positionPlayers.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        formation,
        formationLabel,
        positionPlayers,
      ];
}
