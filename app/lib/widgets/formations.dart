import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/domain/entities/enums/formation_enum.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';

void showFormations(
    BuildContext context, HomeCubit homeCubit, List<int> formations) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => CustomModalFit(
      items: List.generate(
        formations.length,
        (index) => CustomItemModalFit(
          text: FormationEnum.formations[formations[index]]!,
          iconData: AppIcons.user,
          onTap: () {
            homeCubit.setFormation(formations[index]);
          },
        ),
      ),
    ),
  );
}
