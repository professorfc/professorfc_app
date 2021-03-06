import 'package:custom_utilities/custom_utilities.dart';
import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/ads/presentation/bloc/ads_cubit.dart';
import 'package:professorfc_app/features/ads/presentation/pages/banners/banner_ad_widget.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_state.dart';
import 'package:professorfc_app/features/search_teams/presentation/bloc/search_teams_cubit.dart';
import 'package:professorfc_app/setup.dart';
import 'package:professorfc_app/widgets/draggable_floating_action_button.dart';
import 'package:professorfc_app/widgets/fancy_fab.dart';
import 'package:professorfc_app/widgets/formations.dart';
import 'package:professorfc_app/widgets/player_item.dart';
import "package:collection/collection.dart";
import 'package:professorfc_app/widgets/search_teams.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _parentKey = GlobalKey();

  late AdsCubit _adsCubit;
  late HomeCubit _homeCubit;
  late SearchTeamsCubit _searchTeamsCubit;

  @override
  void initState() {
    _adsCubit = root<AdsCubit>()..loadBanner(screenName: 'home', count: 1);

    _searchTeamsCubit = getItInstance.get<SearchTeamsCubit>()..getTeams();

    _homeCubit = getItInstance.get<HomeCubit>()
      ..getTeam()
      ..getFormations();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _homeCubit.setScreenSize(MediaQuery.of(context).size);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Container(
        color: const Color(0xff008001), //TODO:review this
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: _content(),
        ),
      ),
      floatingActionButton: _actionButtons(),
      // TODO:in development
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(AppIcons.futbol),
      //       label: 'Esquema',
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(AppIcons.user),
      //     //   label: 'Eu',
      //     // ),
      //   ],
      //   onTap: (int currentIndex) {},
      // ),
    );
  }

  BlocBuilder<HomeCubit, HomeState> _content() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _homeCubit,
      builder: (context, state) {
        if (state.isLoading == true) {
          return CustomCircularProgressIndicator(
            color: Theme.of(context).backgroundColor,
          );
        }

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            key: _parentKey,
            fit: StackFit.expand,
            children: [
              _buildBackground(),
              if (state.titularPlayers!.isNotEmpty)
                ..._buildTeam(state.titularPlayers!, state.allPlayers!),
              if (state.titularPlayers!.isEmpty) _buildEmptyState(),
              Positioned(
                right: 1,
                left: 1,
                bottom: 1,
                child: BannerAdWidget(
                  adsCubit: _adsCubit,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: Theme.of(context).backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor,
              spreadRadius: 1,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            showSearchTeams(context, _homeCubit, _searchTeamsCubit);
          },
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: "Escolha\no seu time".title(
              context,
              color: Theme.of(context).primaryColor,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  BlocBuilder<HomeCubit, HomeState> _actionButtons() {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _homeCubit,
      buildWhen: (previous, current) {
        return previous.formationPositions != current.formationPositions;
      },
      builder: (context, state) {
        if (state.formationPositions!.isNotEmpty) {
          return FancyFab(
            beginButtonColor: Theme.of(context).backgroundColor,
            searchTeamsCallback: () {
              showSearchTeams(context, _homeCubit, _searchTeamsCubit);
            },
            formmationCallback: () {
              showFormations(context, _homeCubit, state.formationPositions!);
            },
            saveFormmationCallback: () {
              for (var player in _homeCubit.state.titularPlayers!) {
                print(
                    'PLAYER:${player.name} - DX:${player.dx} - DY:${player.dy} - ID:${player.id} - NF:${player.positionNotFound.toString()}');
              }

              _homeCubit.save();
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  List<Widget> _buildTeam(
      List<PlayerModel> titularPlayers, List<PlayerModel> allPlayers) {
    return titularPlayers.map<Widget>((player) {
      return DraggableFloatingActionButton(
        child: PlayerItem(player: player),
        player: player,
        parentKey: _parentKey,
        onPointerUp: (playerChanged) {
          _homeCubit.updatePositionPlayer(playerChanged);
        },
        onPressed: () {
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) => SafeArea(
              child: CustomModalFit(
                items: _allPlayers(player, allPlayers),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  Widget _buildBackground() {
    return RotatedBox(
      quarterTurns: 1,
      child: ClipPath(
        child: Image(
          image: const AssetImage("assets/images/camp_2.png"),
          fit: BoxFit.fitHeight,
          color: Colors.white.withOpacity(0.4),
          colorBlendMode: BlendMode.modulate,
        ),
      ),
    );
  }

  List<Widget> _allPlayers(
      PlayerModel fromPlayer, List<PlayerModel> allPlayers) {
    var _list = <Widget>[];

    var _groupBy =
        allPlayers.groupListsBy((element) => element.positionGroup.value);

    _groupBy.forEach(
      (key, value) {
        value.sort((a, b) => a.name.compareTo(b.name));

        _list.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                key.label(context),
                const Divider(),
                ...value
                    .map(
                      (element) => CustomItemModalFit(
                        text: element.name,
                        iconData: AppIcons.user,
                        onTap: () {
                          _homeCubit.updatePlayer(fromPlayer, element);
                          Navigator.pop(context);
                        },
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        );
      },
    );

    return _list;
  }
}
