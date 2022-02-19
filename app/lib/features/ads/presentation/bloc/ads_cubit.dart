import 'package:custom_utilities/custom_utilities.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:professorfc_app/features/ads/domain/repositories/ads_banner_repository.dart';

part 'ads_state.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit({
    required this.adsBannerRepository,
  }) : super(AdsState.initial());

  final AdsBannerRepository adsBannerRepository;

  void loadBanner({
    required String screenName,
    int count = 1,
    bool adsReset = false,
  }) async {
    var response = await adsBannerRepository.getAdsByScreen(
      screenName: screenName,
      count: count,
      reset: adsReset,
    );

    response.fold((ads) {
      return emit(state.copyWith(isLoading: false, banners: ads));
    }, (exception) {
      return emit(state.copyWith(isLoading: false, isError: true));
    });
  }
}
