import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/formation_enum.dart';

void showFormations(BuildContext context) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => CustomModalFit(
      items: [
        CustomItemModalFit(
          text: FormationEnum.formations[442]!,
          iconData: AppIcons.user,
          onTap: () {},
        ),
        CustomItemModalFit(
          text: FormationEnum.formations[352]!,
          iconData: AppIcons.user,
          onTap: () {},
        ),
      ],
    ),
  );
}

class Formations extends StatelessWidget {
  const Formations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
