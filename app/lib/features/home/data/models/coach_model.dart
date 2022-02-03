import 'package:professorfc_app/features/home/domain/entities/coach.dart';

class CoachModel extends Coach {
  const CoachModel({
    required String name,
    required int age,
  }) : super(
          name: name,
          age: age,
        );

  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      name: json['name'],
      age: json['age'],
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

  CoachModel copyWith() {
    return CoachModel(
      name: name,
      age: age,
    );
  }
}
