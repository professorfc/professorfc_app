import 'dart:io';

import 'package:custom_utilities/custom_utilities.dart';
import 'package:dartz/dartz.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:professorfc_app/features/ads/domain/repositories/ads_banner_repository.dart';

class AdsBannerRepositoryImpl implements AdsBannerRepository {
  Map<String, List<BannerAd>> _adsByScreen = {};

  @override
  Future<Either<List<BannerAd>?, Exception>> getAdsByScreen({
    required String screenName,
    int count = 1,
    bool reset = false,
  }) async {
    try {
      if (reset) {
        _resetBannerList(screenName);
      }

      if (_adsByScreen[screenName] == null) {
        var _list = await _generateBannerList(count);
        _adsByScreen[screenName] = _list;
      }

      return Left<List<BannerAd>?, Exception>(_adsByScreen[screenName]);
    } on dynamic catch (e) {
      _logger(e, null);
      return Right<List<BannerAd>, Exception>(
          (e is Exception) ? e : Exception(e.toString()));
    }
  }

  void _resetBannerList(String screenName) {
    if (_adsByScreen[screenName] != null) {
      for (var banner in _adsByScreen[screenName]!) {
        banner.dispose();
      }

      _adsByScreen.remove(screenName);
    }
  }

  Future<List<BannerAd>> _generateBannerList(int count) async {
    var _result = <BannerAd>[];

    for (var i = 0; i < count; i++) {
      var _item = await _generateBanner();
      _result.add(_item);
    }

    return _result;
  }

  Future<BannerAd> _generateBanner({AdSize? size}) async {
    var _bannerAd = BannerAd(
      adUnitId: _getAdUnitId()!,
      request: AdRequest(),
      size: size ?? AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          _logger(Exception('$error'), null);
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );

    await _bannerAd.load();

    return _bannerAd;
  }

  String? _getAdUnitId() {
    // if (isInDebugMode) {
    //   return BannerAd.testAdUnitId;
    // }

    //TODO:remote config in here ?
    if (Platform.isAndroid) {
      return 'ca-app-pub-5039935894572150/6212821455';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5039935894572150/3384645425';
    }

    return null;
  }

  void _logger(dynamic onError, Map<String, dynamic>? jsonMap) {
    // getItInstance<LoggerService>()
    //   ..addLogAsync(
    //     LoggerModel(
    //       typeError: LoggerTypeEnum.Error,
    //       // ignore: always_specify_types
    //       error: {
    //         'body': onError?.toString(),
    //       },
    //       message: onError?.message,
    //       // ignore: always_specify_types
    //       extraInfo: {
    //         'query': jsonMap,
    //       },
    //     ),
    //     getItInstance.get<UserWrapper>().getUser?.email,
    //   );
  }
}
