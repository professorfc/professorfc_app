import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:professorfc_app/features/search_teams/presentation/bloc/search_teams_cubit.dart';

void registerBlocs(GetIt getItInstance) {
  getItInstance
      .registerLazySingleton<HomeCubit>(() => HomeCubit(getItInstance()));

  getItInstance.registerLazySingleton<SearchTeamsCubit>(
      () => SearchTeamsCubit(getItInstance()));
}
