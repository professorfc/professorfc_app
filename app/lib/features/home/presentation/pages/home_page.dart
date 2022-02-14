import 'package:custom_utilities/custom_utilities.dart';
import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/features/home/data/models/player_model.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_cubit.dart';
import 'package:professorfc_app/features/home/presentation/bloc/home_state.dart';
import 'package:professorfc_app/setup.dart';
import 'package:professorfc_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:professorfc_app/widgets/draggable_floating_action_button.dart';
import 'package:professorfc_app/widgets/fancy_fab.dart';
import 'package:professorfc_app/widgets/formations.dart';
import 'package:professorfc_app/widgets/player_item.dart';
import "package:collection/collection.dart";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _parentKey = GlobalKey();
  late HomeCubit _homeCubit;

  @override
  void initState() {
    _homeCubit = getItInstance.get<HomeCubit>()..getPlayers();

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
        color: const Color(0xff008001),
        constraints: const BoxConstraints.expand(),
        child: BlocBuilder<HomeCubit, HomeState>(
          bloc: _homeCubit,
          builder: (context, state) {
            if (state.isLoading == true) {
              return CustomCircularProgressIndicator(
                color: Theme.of(context).backgroundColor,
              );
            } else if (state.titularPlayers!.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  key: _parentKey,
                  fit: StackFit.expand,
                  children: [
                    _buildBackground(),
                    ..._buildTeam(state.titularPlayers!, state.allPlayers!),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FancyFab(
        beginButtonColor: Theme.of(context).backgroundColor,
        formmationCallback: () {
          showFormations(context, _homeCubit);
        },
        saveFormmationCallback: () {
          for (var player in _homeCubit.state.titularPlayers!) {
            print(
                'PLAYER:${player.name} - DX:${player.dx} - DY:${player.dy} - ID:${player.id} - NF:${player.positionNotFound.toString()}');
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.futbol),
            label: 'Esquema',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.user),
            label: 'Eu',
          ),
        ],
        onTap: (int currentIndex) {},
      ),
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
            builder: (context) => CustomModalFit(
              items: _allPlayers(player, allPlayers),
            ),
          );
        },
      );
    }).toList();
  }

  Widget _buildBackground() {
    return const RotatedBox(
      quarterTurns: 1,
      child: ClipPath(
        child: Image(
          image: AssetImage("assets/images/camp_2.png"),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  List<Widget> _allPlayers(
      PlayerModel fromPlayer, List<PlayerModel> allPlayers) {
    var _list = <Widget>[];

    var _groupBy =
        allPlayers.groupListsBy((element) => element.positionGroup.value);

    _groupBy.forEach((key, value) {
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
    });

    return _list;
  }
}
