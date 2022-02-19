import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';

class PositionPlayerModel extends Equatable {
  const PositionPlayerModel(
    this.line,
    this.position, {
    required this.dx,
    required this.dy,
  });

  final double dx;
  final double dy;
  final LineEnum line;
  final PositionEnum position;

  factory PositionPlayerModel.fromJson(Map<String, dynamic> json) {
    return PositionPlayerModel(
      LineEnum.values[json['line']],
      PositionEnum.values[json['position']],
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
    return {
      'dx': dx,
      'dy': dy,
      'line': line.index,
      'position': position.index,
    };
  }

  PositionPlayerModel copyWith() {
    return PositionPlayerModel(
      line,
      position,
      dx: dx,
      dy: dy,
    );
  }

  @override
  List<Object?> get props => [
        line,
        position,
        dx,
        dy,
      ];
}
