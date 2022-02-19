import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';
import 'package:professorfc_app/features/home/data/models/teams_model.dart';
import 'package:professorfc_app/shared/load_mock.dart';

abstract class SearchTeamsRemoteDataSource {
  Future<TeamsModel> getTeams();
}

class SearchTeamsRemoteDataSourceImpl implements SearchTeamsRemoteDataSource {
  SearchTeamsRemoteDataSourceImpl(this.remoteClientRepository);

  final RemoteClientRepository remoteClientRepository;

  @override
  Future<TeamsModel> getTeams() async {
    var _list = <TeamModel>[];
    var _teams = <String>[
      "corinthians",
      "sao_paulo",
    ];

    for (var teamName in _teams) {
      var _team = await _getTeam(teamName);
      _list.add(_team);
    }

    _list.sort((a, b) => a.name.compareTo(b.name));

    TeamsModel _result = TeamsModel(teams: _list);
    return Future.value(_result);
  }

  Future<TeamModel> _getTeam(String teamName) async {
    var response = await LoadMock.fromAsset("teams/$teamName.json");
    return Future.value(TeamModel.fromJson(response));
  }
}
