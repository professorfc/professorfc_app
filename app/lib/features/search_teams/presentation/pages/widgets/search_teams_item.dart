import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/data/models/team_model.dart';

class SearchTeamsItem extends StatelessWidget {
  const SearchTeamsItem({
    Key? key,
    required this.team,
    required this.onTap,
  }) : super(key: key);

  final TeamModel team;
  final Function(TeamModel) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(team);
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: CachedNetworkImage(
                imageUrl: team.icon,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(AppIcons.exclamation),
              ),
            ),
            SpacerBox.h8,
            team.name.description(context),
          ],
        ),
      ),
    );
  }
}
