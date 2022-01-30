import 'package:custom_utilities/custom_utilities.dart';
import 'package:dartz/dartz.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
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
}
