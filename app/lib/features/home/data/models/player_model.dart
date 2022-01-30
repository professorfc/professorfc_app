import 'package:professorfc_app/features/home/domain/entities/player.dart';

class PlayerModel extends Player {
  const PlayerModel({
    required String name,
    String? photo,
    required double dx,
    required double dy,
  }) : super(
          name: name,
          photo: photo,
          dx: dx,
          dy: dy,
        );

  factory PlayerModel.fromJson(Map<String, dynamic> json) {
    return PlayerModel(
      name: json['name'],
      photo: json['photo'],
      dx: json['dx'],
      dy: json['dy'],
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
    );
  }
}
