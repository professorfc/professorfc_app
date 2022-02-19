import 'dart:convert';

import 'package:custom_utilities/custom_utilities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/data/models/formation_position_model.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/data/models/position_player_model.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';
import 'package:professorfc_app/features/home/domain/repositories/home_repository.dart';
import 'home_state.dart';

part 'calculate_coordenate.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeState.initial());

  final HomeRepository homeRepository;

  void save() {
    try {
      var _jsonTeam = jsonEncode(state.team!.toJson());
      print(_jsonTeam);

      var _jsonFormationPositions =
          jsonEncode(state.formationPositions!.map((e) => e.toJson()).toList());
      print(_jsonFormationPositions);
    } catch (e) {
      print(e.toString());
    }
  }

  void setScreenSize(Size size) {
    emit(state.copyWith(screenSize: size));
  }

  void updatePlayer(PlayerModel fromPlayer, PlayerModel toPlayer) {
    var _titularPlayers = state.titularPlayers ?? [];

    var _indexInTitularPlayer =
        _titularPlayers.indexWhere((element) => element.id == toPlayer.id);

    if (_indexInTitularPlayer != -1) {
      return;
    }

    var _indexFrom =
        _titularPlayers.indexWhere((element) => element.id == fromPlayer.id);

    toPlayer.dx = fromPlayer.dx;
    toPlayer.dy = fromPlayer.dy;
    toPlayer.positionNotFound = false;

    _titularPlayers[_indexFrom] = toPlayer;

    emit(
      state.copyWith(
        titularPlayers: _titularPlayers,
        forceRefresh: StateUtils.generateRandomNumber() as int?,
      ),
    );
  }

  void updatePositionPlayer(PlayerModel player) {
    var _titularPlayers = state.titularPlayers ?? [];
    var _index =
        _titularPlayers.indexWhere((element) => element.id == player.id);
    if (_index != -1) {
      _titularPlayers[_index] = player;
      emit(
        state.copyWith(
          titularPlayers: _titularPlayers,
          forceRefresh: StateUtils.generateRandomNumber() as int?,
        ),
      );
    }
  }

  void getFormations() async {
    Either<List<FormationPositionModel>, Exception> _response =
        await homeRepository.getFormations();

    _response.fold((model) {
      emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        formationPositions: model,
      ));
    }, (error) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        isSuccess: false,
      ));
    });
  }

  void getTeam() async {
    emit(state.copyWith(
      isLoading: true,
      forceRefresh: StateUtils.generateRandomNumber() as int?,
    ));

    Either<TeamModel, Exception> _response = await homeRepository.getTeam();

    _response.fold((team) {
      setTeam(team);
    }, (error) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        isSuccess: false,
      ));
    });
  }

  void setTeam(TeamModel team) {
    var _titularPlayers = team.holders;

    for (var item in _titularPlayers) {
      item.dx = CalculateCoordinates.getRelativeWidth(
          state.screenSize!.width, item.dx);

      item.dy = CalculateCoordinates.getRelativeHeight(
          state.screenSize!.height, item.dy);
    }

    emit(state.copyWith(
      isLoading: false,
      isError: false,
      isSuccess: false,
      team: team,
      titularPlayers: _titularPlayers,
      allPlayers: <PlayerModel>[
        ...team.holders,
        ...team.reservers,
      ],
    ));
  }

  void setFormation(String id) {
    var _titularPlayers = state.titularPlayers ?? [];
    var _playersPositionChanged = <PlayerModel>[];

    var _formationPositions =
        state.formationPositions!.firstWhere((element) => element.id == id);

    _setCoordinate(
        _formationPositions, _titularPlayers, _playersPositionChanged);

    List<PlayerModel> _titularPlayersPositionNotFound = _titularPlayers
        .where((element) =>
            !_playersPositionChanged.any((e) => e.id == element.id))
        .toList();

    for (var player in _titularPlayersPositionNotFound) {
      player.positionNotFound = true;
    }

    emit(state.copyWith(
      titularPlayers: _titularPlayers,
      forceRefresh: StateUtils.generateRandomNumber() as int?,
    ));
  }

  void _setCoordinate(
    FormationPositionModel _formationPosition,
    List<PlayerModel> _titularPlayers,
    List<PlayerModel> _playersPositionChanged,
  ) {
    for (PositionPlayerModel positionPlayer
        in _formationPosition.positionPlayers) {
      int _index = _titularPlayers.indexWhere(
        (element) =>
            element.lines.any((line) => line == positionPlayer.line) &&
            element.positions
                .any((position) => position == positionPlayer.position) &&
            !_playersPositionChanged.contains(element),
      );

      if (_index != -1) {
        var _player = _titularPlayers[_index];

        _player.positionNotFound = false;

        _player.dx = CalculateCoordinates.getRelativeWidth(
            state.screenSize!.width, positionPlayer.dx);

        _player.dy = CalculateCoordinates.getRelativeHeight(
            state.screenSize!.height, positionPlayer.dy);

        _playersPositionChanged.add(_player);
      }
    }
  }
}
