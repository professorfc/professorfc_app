import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';

class HomeState extends DefaultState {
  HomeState({
    bool? isLoading,
    bool? isEmpty,
    bool? isError,
    bool? isSuccess,
    String? errorMessage,
    this.players,
    this.forceRefresh,
  }) : super(
          isLoading: isLoading,
          isSuccess: isSuccess,
          isEmpty: isEmpty,
          isError: isError,
          errorMessage: errorMessage,
        );

  final int? forceRefresh;
  final List<PlayerModel>? players;

  factory HomeState.initial() {
    return HomeState(
      isSuccess: false,
      isEmpty: false,
      isError: false,
      isLoading: false,
      errorMessage: null,
      players: const [],
      forceRefresh: null,
    );
  }

  HomeState copyWith(
      {bool? isLoading,
      bool? isSuccess,
      bool? isEmpty,
      bool? isError,
      String? errorMessage,
      List<PlayerModel>? players,
      int? forceRefresh}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isEmpty: isEmpty ?? this.isEmpty,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
      players: players ?? this.players,
      forceRefresh: forceRefresh ?? this.forceRefresh,
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
      ];
}
