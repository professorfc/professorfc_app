import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({
    Key? key,
    required this.player,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;
  final PlayerModel player;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
