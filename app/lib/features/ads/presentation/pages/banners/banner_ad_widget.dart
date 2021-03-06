import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:professorfc_app/features/ads/presentation/bloc/ads_cubit.dart';

class BannerAdWidget extends StatelessWidget {
  const BannerAdWidget({
    Key? key,
    required this.adsCubit,
  }) : super(key: key);

  final AdsCubit adsCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AdSize.banner.width.toDouble(),
      height: AdSize.banner.height.toDouble(),
      child: BlocBuilder<AdsCubit, AdsState>(
        bloc: adsCubit,
        builder: (context, state) {
          if (state.banners!.isNotEmpty) {
            return AdWidget(ad: state.banners![0]);
          }

          return const SizedBox.shrink();
        },
      ),
      color: Colors.transparent,
    );
  }
}

//TODO:review this
// class BannerAdWidget extends StatefulWidget {
//   BannerAdWidget({
//     required this.screenName,
//     this.itemCount,
//     this.indexRender,
//   });

//   final String screenName;

//   final int? itemCount;
//   final int? indexRender;

//   @override
//   _BannerAdWidgetState createState() => _BannerAdWidgetState();
// }

// class _BannerAdWidgetState extends State<BannerAdWidget> {
//   AdsCubit? _adsCubit;

//   @override
//   void initState() {
//     _adsCubit = root<AdsCubit>()
//       ..loadBanner(screenName: widget.screenName, count: widget.itemCount ?? 1);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: AdSize.banner.width.toDouble(),
//       height: AdSize.banner.height.toDouble(),
//       child: BlocBuilder<AdsCubit, AdsState>(
//         bloc: _adsCubit,
//         builder: (context, state) {
//           if (state.banners!.length > 0)
//             return AdWidget(ad: state.banners![widget.indexRender ?? 0]);

//           return SizedBox.shrink();
//         },
//       ),
//       color: Colors.transparent,
//     );
//   }
// }
