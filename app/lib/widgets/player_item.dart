import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showMaterialModalBottomSheet(
          context: context,
          builder: (context) => CustomModalFit(
            items: [
              CustomItemModalFit(
                text: 'Jogador 1',
                iconData: AppIcons.user,
                onTap: () {},
              ),
              CustomItemModalFit(
                text: 'Jogador 2',
                iconData: AppIcons.user,
                onTap: () {},
              ),
            ],
          ),
        );
      },
      child: Column(
        children: const [
          SizedBox(
            height: 50,
            child: ClipPath(
              child: Image(
                image: AssetImage("assets/images/player_2.png"),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text("Fulano de tal"),
        ],
      ),
    );
  }
}
