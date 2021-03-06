import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_group_enum.dart';
import 'package:professorfc_app/features/home/domain/entities/player.dart';

class PlayerModel extends Player {
  PlayerModel({
    required String id,
    required String name,
    String? photo,
    required double dx,
    required double dy,
    required List<LineEnum> lines,
    required bool startingPlayer,
    required List<PositionEnum> positions,
    bool positionNotFound = false,
    required PositionGroupEnum positionGroup,
  }) : super(
          id: id,
          name: name,
          photo: photo,
          dx: dx,
          dy: dy,
          lines: lines,
          startingPlayer: startingPlayer,
          positions: positions,
          positionNotFound: positionNotFound,
          positionGroup: positionGroup,
        );

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      dx: json['dx'],
      dy: json['dy'],
      startingPlayer: json['startingPlayer'],
      positionGroup: PositionGroupEnum(json['positionGroup']),
      positions: json['positions'] != null
          ? (json['positions'] as List)
              .map((e) => PositionEnum.values[e])
              .toList()
          : [],
      lines: json['lines'] != null
          ? (json['lines'] as List).map((e) => LineEnum.values[e]).toList()
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

    return {
      'id': id,
      'name': name,
      'photo': photo,
      'dx': dx,
      'dy': dy,
      'lines': lines.map((e) => e.index).toList(),
      'startingPlayer': startingPlayer,
      'positions': positions.map((e) => e.index).toList(),
      'positionNotFound': positionNotFound,
      'positionGroup': positionGroup.value
    };
  }

  PlayerModel copyWith() {
    return PlayerModel(
      id: id,
      name: name,
      photo: photo,
      dx: dx,
      dy: dy,
      lines: lines,
      startingPlayer: startingPlayer,
      positions: positions,
      positionNotFound: positionNotFound,
      positionGroup: positionGroup,
    );
  }
}
