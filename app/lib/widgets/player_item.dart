import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({Key? key, required this.allPlayers}) : super(key: key);

  final List<CustomItemModalFit> allPlayers;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => CustomModalFit(
            items: allPlayers,
          ),
        );
      },
      child: SizedBox(
        width: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 50,
              child: ClipPath(
                child: Image(
                  image: AssetImage("assets/images/player_2.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SpacerBox.v4,
            "Fulano de tal".description(
              context,
              textAlign: TextAlign.center,
              color: Theme.of(context).backgroundColor,
              maxLines: 2,
              fontSize: CustomFontSize.f13,
            ),
          ],
        ),
      ),
    );
  }
}
