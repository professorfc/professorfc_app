import 'dart:math';

import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/coach_model.dart';
import 'package:professorfc_app/features/home/data/models/formation_position_model.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/data/models/position_player_model.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_group_enum.dart';
import 'package:professorfc_app/shared/load_mock.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './teams/corinthians_mixin.dart';
part './teams/sao_paulo_mixin.dart';
part './teams/palmeiras_mixin.dart';
part './teams/santos_mixin.dart';
part 'formation_position_mixin.dart';

abstract class HomeRemoteDataSource {
  Future<TeamModel?> getTeam();
  Future<void> setTeam(String key);
  Future<List<FormationPositionModel>> getFormations();
}

class HomeRemoteDataSourceImpl
    with SantosTeamMockMixin, FormationPositionMixin
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.remoteClientRepository);

  final RemoteClientRepository remoteClientRepository;

  static const String _latestTeamSelected = "latest_team_selected";

  @override
  Future<TeamModel?> getTeam() async {
    final prefs = await SharedPreferences.getInstance();
    var _value = prefs.getString(_latestTeamSelected);

    if (_value != null) {
      var response = await LoadMock.fromAsset("teams/$_value.json");
      return Future.value(TeamModel.fromJson(response));
      //return getTeamFromModel();
    }

    return Future.value(null);
  }

  @override
  Future<List<FormationPositionModel>> getFormations() async {
    var response = await LoadMock.fromAsset("formations/formations.json");

    var completeList = (response['data'] as List)
        .map((e) => FormationPositionModel.fromJson(e))
        .toList();

    return Future.value(completeList);
  }

  @override
  Future<void> setTeam(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_latestTeamSelected, key);
  }
}
