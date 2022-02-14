import 'package:custom_utilities/custom_utilities.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/formation_enum.dart';
import 'package:professorfc_app/features/home/domain/repositories/home_repository.dart';
import 'home_state.dart';

class CalculateCoordinates {
  static const double _width_base = 411.4;
  static const double _height_base = 683.4;

  static double getRelativeWidth(double screenWidth, double value) {
    double fromValue1 = _width_base;
    double toValue1 = value;

    double fromValue2 = screenWidth;
    double? toValue2;

    toValue2 = (fromValue2 * toValue1) / fromValue1;

    return toValue2;
  }

  static double getRelativeHeight(double screenHeight, double value) {
    double fromValue1 = _height_base;
    double toValue1 = value;

    double fromValue2 = screenHeight;
    double? toValue2;

    toValue2 = (fromValue2 * toValue1) / fromValue1;

    return toValue2;
  }
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeState.initial());

  final HomeRepository homeRepository;

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

  void getPlayers() async {
    emit(state.copyWith(
      isLoading: true,
      forceRefresh: StateUtils.generateRandomNumber() as int?,
    ));

    Either<List<PlayerModel>, Exception> _response =
        await homeRepository.getPlayers();

    _response.fold((allPlayers) {
      var _titularPlayers =
          allPlayers.where((element) => element.startingPlayer).toList();

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
        titularPlayers: _titularPlayers,
        allPlayers: allPlayers,
      ));
    }, (error) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        isSuccess: false,
      ));
    });
  }

  void setFormation(int formation) {
    var _titularPlayers = state.titularPlayers ?? [];
    var _playersPositionChanged = <PlayerModel>[];

    List<PositionPlayer>? _positionPlayers =
        FormationPositionsEnum.formations[formation];

    if (_positionPlayers != null) {
      _setCoordinate(
          _positionPlayers, _titularPlayers, _playersPositionChanged);

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
  }

  void _setCoordinate(
    List<PositionPlayer> _positionPlayers,
    List<PlayerModel> _titularPlayers,
    List<PlayerModel> _playersPositionChanged,
  ) {
    for (PositionPlayer positionPlayer in _positionPlayers) {
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
