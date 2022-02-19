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

part './teams/corinthians_mixin.dart';
part './teams/sao_paulo_mixin.dart';
part './teams/palmeiras_mixin.dart';
part './teams/santos_mixin.dart';
part 'formation_position_mixin.dart';

abstract class HomeRemoteDataSource {
  Future<TeamModel> getTeam();
  Future<List<FormationPositionModel>> getFormations();
}

class HomeRemoteDataSourceImpl
    with SantosTeamMockMixin, FormationPositionMixin
    implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl(this.remoteClientRepository);

  final RemoteClientRepository remoteClientRepository;

  @override
  Future<TeamModel> getTeam() async {
    // var response = await LoadMock.fromAsset("teams/corinthians.json");
    // return Future.value(TeamModel.fromJson(response));

    return getTeamFromModel();
  }

  @override
  Future<List<FormationPositionModel>> getFormations() async {
    var response = await LoadMock.fromAsset("formations/formations.json");

    var completeList = (response['data'] as List)
        .map((e) => FormationPositionModel.fromJson(e))
        .toList();

    return Future.value(completeList);
  }
}
