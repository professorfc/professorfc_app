import 'package:custom_utilities/custom_utilities.dart';
import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/formation_enum.dart';
import 'package:professorfc_app/features/home/domain/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeState.initial());

  final HomeRepository homeRepository;

  void updatePlayer(PlayerModel player) {
    var _players = state.players ?? [];
    var _index = _players.indexWhere((element) => element.id == player.id);
    if (_index != -1) {
      _players[_index] = player;
      emit(
        state.copyWith(
          players: _players,
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

    _response.fold((model) {
      emit(state.copyWith(
        isLoading: false,
        isError: false,
        isSuccess: false,
        players: model,
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
    var _players = state.players ?? [];
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

          _player.dx = positionPlayer.dx;
          _player.dy = positionPlayer.dy;

          _playersPositionChanged.add(_player);
        }
      }

      emit(state.copyWith(
        players: _players,
        forceRefresh: StateUtils.generateRandomNumber() as int?,
      ));
    }
  }
}
