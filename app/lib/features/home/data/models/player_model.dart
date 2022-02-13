import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';
import 'package:professorfc_app/features/home/domain/entities/player.dart';

class PlayerModel extends Player {
  PlayerModel({
    required String id,
    required String name,
    String? photo,
    required double dx,
    required double dy,
    required List<PositionEnum> positions,
    required bool startingPlayer,
  }) : super(
          id: id,
          name: name,
          photo: photo,
          dx: dx,
          dy: dy,
          positions: positions,
          startingPlayer: startingPlayer,
        );

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      dx: json['dx'],
      dy: json['dy'],
      startingPlayer: json['startingPlayer'],
      positions: json['positions'] != null
          ? (json['positions'] as List)
              .map((e) => PositionEnum.values[json['positions']])
              .toList()
          : [],
    );
  }

  @override
  String toString() {
    return '''
    ''';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }

  PlayerModel copyWith() {
    return PlayerModel(
      id: id,
      name: name,
      photo: photo,
      dx: dx,
      dy: dy,
      positions: positions,
      startingPlayer: startingPlayer,
    );
  }
}
