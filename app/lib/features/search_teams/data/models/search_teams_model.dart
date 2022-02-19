import 'package:custom_utilities/custom_utilities.dart';

class SearchTeamsModel extends Equatable {
  const SearchTeamsModel();
  // const SearchTeamsModel(
  //     {})
  //     : super();

  factory SearchTeamsModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> data = <String, dynamic>{};
    data = json;

    return SearchTeamsModel();
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

  SearchTeamsModel copyWith() {
    return SearchTeamsModel();
  }

  @override
  List<Object?> get props => [];
}
