import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/data/models/formation_position_model.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';

void showFormations(BuildContext context, HomeCubit homeCubit,
    List<FormationPositionModel> formationPositions) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => CustomModalFit(
      items: List.generate(
        formationPositions.length,
        (index) => CustomItemModalFit(
          text: formationPositions[index].formationLabel,
          iconData: AppIcons.user,
          onTap: () {
            homeCubit.setFormation(formationPositions[index].id);
          },
        ),
      ),
    ),
  );
}
