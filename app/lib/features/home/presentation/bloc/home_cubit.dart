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

  void updatePlayer(PlayerModel player) {
    var _players = state.titularPlayers ?? [];
    var _index = _players.indexWhere((element) => element.id == player.id);
    if (_index != -1) {
      _players[_index] = player;
      emit(
        state.copyWith(
          titularPlayers: _players,
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
    var _players = state.titularPlayers ?? [];
    var _playersPositionChanged = <PlayerModel>[];

    List<PositionPlayer>? _positionPlayers =
        FormationPositionsEnum.formations[formation];

    if (_positionPlayers != null) {
      for (PositionPlayer positionPlayer in _positionPlayers) {
        int _index = _players.indexWhere(
          (element) =>
              element.positions
                  .any((position) => position == positionPlayer.position) &&
              !_playersPositionChanged.contains(element),
        );

        if (_index != -1) {
          var _player = _players[_index];

          _player.dx = CalculateCoordinates.getRelativeWidth(
              state.screenSize!.width, positionPlayer.dx);

          _player.dy = CalculateCoordinates.getRelativeHeight(
              state.screenSize!.height, positionPlayer.dy);

          _playersPositionChanged.add(_player);
        }
      }

      emit(state.copyWith(
        titularPlayers: _players,
        forceRefresh: StateUtils.generateRandomNumber() as int?,
      ));
    }
  }
}
