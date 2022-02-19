import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';

class SearchTeamsState extends DefaultState {
  SearchTeamsState({
    bool? isLoading,
    bool? isEmpty,
    bool? isError,
    bool? isSuccess,
    String? errorMessage,
    this.teams,
  }) : super(
          isLoading: isLoading,
          isSuccess: isSuccess,
          isEmpty: isEmpty,
          isError: isError,
          errorMessage: errorMessage,
        );

  final List<TeamModel>? teams;

  factory SearchTeamsState.initial() {
    return SearchTeamsState(
      isSuccess: false,
      isEmpty: false,
      isError: false,
      isLoading: false,
      errorMessage: null,
      teams: const [],
    );
  }

  SearchTeamsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isEmpty,
    bool? isError,
    String? errorMessage,
    List<TeamModel>? teams,
  }) {
    return SearchTeamsState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isEmpty: isEmpty ?? this.isEmpty,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      teams: teams ?? this.teams,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        isError,
        isEmpty,
        errorMessage,
        teams,
      ];
}
