import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';
import 'package:professorfc_app/features/home/domain/entities/player.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required String name,
    String? photo,
    required double dx,
    required double dy,
    required PositionEnum position,
  }) : super(
          name: name,
          photo: photo,
          dx: dx,
          dy: dy,
          position: position,
        );

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      name: json['name'],
      photo: json['photo'],
      dx: json['dx'],
      dy: json['dy'],
      position: PositionEnum.values[json['position']],
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
      name: name,
      photo: photo,
      dx: dx,
      dy: dy,
      position: position,
    );
  }
}
