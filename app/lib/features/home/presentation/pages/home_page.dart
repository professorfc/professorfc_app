import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';
import 'package:professorfc_app/widgets/custom_bottom_navigation_bar.dart';
import 'package:professorfc_app/widgets/fancy_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Container(
        color: const Color(0xff008001),
        constraints: const BoxConstraints.expand(),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackground(),
              _buildTeam(),
            ],
          ),
        ),
      ),
      floatingActionButton: FancyFab(
        beginButtonColor: Theme.of(context).backgroundColor,
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

  Widget _buildTeam() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
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
}
