import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/formation_enum.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';

void showFormations(BuildContext context, HomeCubit homeCubit) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => CustomModalFit(
      items: [
        CustomItemModalFit(
          text: FormationEnum.formations[442]!,
          iconData: AppIcons.user,
          onTap: () {
            homeCubit.setFormation(442);
          },
        ),
        CustomItemModalFit(
          text: FormationEnum.formations[4231]!,
          iconData: AppIcons.user,
          onTap: () {
            homeCubit.setFormation(4231);
          },
        ),
        CustomItemModalFit(
          text: FormationEnum.formations[4141]!,
          iconData: AppIcons.user,
          onTap: () {
            homeCubit.setFormation(4141);
          },
        ),
        CustomItemModalFit(
          text: FormationEnum.formations[352]!,
          iconData: AppIcons.user,
          onTap: () {
            homeCubit.setFormation(352);
          },
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
