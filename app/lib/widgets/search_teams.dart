import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:professorfc_app/features/search_teams/presentation/bloc/search_teams_cubit.dart';
import 'package:professorfc_app/features/search_teams/presentation/pages/widgets/search_teams_item.dart';

void showSearchTeams(BuildContext context, HomeCubit homeCubit,
    SearchTeamsCubit searchTeamsCubit) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (context) => ListView.separated(
      itemBuilder: (context, index) {
        return SearchTeamsItem(
          team: searchTeamsCubit.state.teams![index],
          onTap: (team) {
            homeCubit.setTeam(team);
            Navigator.of(context).pop();
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: searchTeamsCubit.state.teams!.length,
    ),
  );
}
