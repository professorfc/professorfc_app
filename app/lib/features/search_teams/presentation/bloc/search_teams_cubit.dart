import 'package:custom_utilities/custom_utilities.dart';
import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/models/teams_model.dart';
import 'package:professorfc_app/features/search_teams/domain/repositories/search_teams_repository.dart';
import 'search_teams_state.dart';

class SearchTeamsCubit extends Cubit<SearchTeamsState> {
  SearchTeamsCubit(this.searchTeamsRepository)
      : super(SearchTeamsState.initial());

  final SearchTeamsRepository searchTeamsRepository;

  void getTeams() async {
    Either<TeamsModel, Exception> _response =
        await searchTeamsRepository.getTeams();

    _response.fold((model) {
      emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        teams: model.teams,
      ));
    }, (error) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        isSuccess: false,
      ));
    });
  }
}
