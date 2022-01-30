import 'package:flutter/material.dart';

class PlayerItem extends StatelessWidget {
  const PlayerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
