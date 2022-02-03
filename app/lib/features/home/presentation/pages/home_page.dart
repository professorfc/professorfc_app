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
            } else if (state.players!.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
                  key: _parentKey,
                  fit: StackFit.expand,
                  children: [
                    _buildBackground(),
                    ..._buildTeam(state.players!),
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
          showFormations(context);
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

  List<Widget> _buildTeam(List<PlayerModel> players) {
    return players.map<Widget>((e) {
      return DraggableFloatingActionButton(
        child: PlayerItem(
          player: e,
          onTap: () {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => CustomModalFit(
                items: _allPlayers(),
              ),
            );
          },
        ),
        initialOffset: Offset(e.dx, e.dy),
        parentKey: _parentKey,
        onPressed: () {},
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

  List<CustomItemModalFit> _allPlayers() {
    return [
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
      CustomItemModalFit(
        text: 'Jogador 1',
        iconData: AppIcons.user,
        onTap: () {},
      ),
      CustomItemModalFit(
        text: 'Jogador 3',
        iconData: AppIcons.user,
        onTap: () {},
      ),
    ];
  }
}
