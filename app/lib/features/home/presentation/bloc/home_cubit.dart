import 'package:custom_utilities/custom_utilities.dart';
import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/formation_enum.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/position_enum.dart';
import 'package:professorfc_app/features/home/domain/repositories/home_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeState.initial());

  final HomeRepository homeRepository;

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
    var _players = state.players;

    Map<PositionEnum, List<PositionPlayer>>? _formation =
        FormationPositionsEnum.formations[formation];

    if (_formation != null) {
      for (PositionEnum key in _formation.keys) {
        int? _index = _players?.indexWhere((element) => element.position == key);
        if (_index != null) {
          _players![0].dx = _formation[key].first
        }
      }
    }
  }
}
