import 'package:custom_utilities/custom_utilities.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';

void registerBlocs(GetIt getItInstance) {
  getItInstance
      .registerLazySingleton<HomeCubit>(() => HomeCubit(getItInstance()));
}
