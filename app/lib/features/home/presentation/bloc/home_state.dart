import 'package:custom_utilities/custom_utilities.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/data/models/formation_position_model.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';

class HomeState extends DefaultState {
  HomeState({
    bool? isLoading,
    bool? isEmpty,
    bool? isError,
    bool? isSuccess,
    String? errorMessage,
    this.titularPlayers,
    this.allPlayers,
    this.forceRefresh,
    this.screenSize,
    this.team,
    this.formationPositions,
  }) : super(
          isLoading: isLoading,
          isSuccess: isSuccess,
          isEmpty: isEmpty,
          isError: isError,
          errorMessage: errorMessage,
        );

  final int? forceRefresh;
  final List<PlayerModel>? titularPlayers;
  final List<PlayerModel>? allPlayers;
  final Size? screenSize;
  final TeamModel? team;
  final List<FormationPositionModel>? formationPositions;

  factory HomeState.initial() {
    return HomeState(
      isSuccess: false,
      isEmpty: false,
      isError: false,
      isLoading: false,
      errorMessage: null,
      titularPlayers: const [],
      allPlayers: const [],
      forceRefresh: null,
      screenSize: null,
      team: null,
      formationPositions: const [],
    );
  }

  HomeState copyWith(
      {bool? isLoading,
      bool? isSuccess,
      bool? isEmpty,
      bool? isError,
      String? errorMessage,
      List<PlayerModel>? titularPlayers,
      List<PlayerModel>? allPlayers,
      int? forceRefresh,
      Size? screenSize,
      TeamModel? team,
      List<FormationPositionModel>? formationPositions}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isEmpty: isEmpty ?? this.isEmpty,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      titularPlayers: titularPlayers ?? this.titularPlayers,
      allPlayers: allPlayers ?? this.allPlayers,
      forceRefresh: forceRefresh ?? this.forceRefresh,
      screenSize: screenSize ?? this.screenSize,
      team: team ?? this.team,
      formationPositions: formationPositions ?? this.formationPositions,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        isError,
        isEmpty,
        errorMessage,
        forceRefresh,
        titularPlayers,
        allPlayers,
        screenSize,
        team,
        formationPositions,
      ];
}
