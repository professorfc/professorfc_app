import 'package:custom_view/custom_view.dart';
import 'package:flutter/material.dart';

class FancyFab extends StatefulWidget {
  final Function()? onPressed;
  final String? tooltip;
  final IconData? icon;
  final Color beginButtonColor;

  final VoidCallback formmationCallback;

  FancyFab({
    required this.beginButtonColor,
    this.onPressed,
    this.tooltip,
    this.icon,
    required this.formmationCallback,
  });

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  late AnimationController _animationController;
  late Animation<Color?> _buttonColor;
  late Animation<double> _animateIcon;
  late Animation<double> _translateButton;
  final Curve _curve = Curves.easeOut;
  final double _fabHeight = 56.0;

  @override
  initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _buttonColor = ColorTween(
      begin: widget.beginButtonColor,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.00,
          1.00,
          curve: Curves.linear,
        ),
      ),
    );

    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.0,
        0.75,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  FloatingActionButtonThemeData get _overrideFloactingActionButtonTheme {
    return Theme.of(context).floatingActionButtonTheme.copyWith(
          backgroundColor: Theme.of(context).backgroundColor,
          foregroundColor: Theme.of(context).primaryColor,
        );
  }

  Widget formation() {
    return FloatingActionButton(
      onPressed: widget.formmationCallback,
      backgroundColor: _overrideFloactingActionButtonTheme.backgroundColor,
      foregroundColor: _overrideFloactingActionButtonTheme.foregroundColor,
      tooltip: 'Formation',
      child: const Icon(AppIcons.futbol),
    );
  }

  Widget share() {
    return FloatingActionButton(
      onPressed: null,
      backgroundColor: _overrideFloactingActionButtonTheme.backgroundColor,
      foregroundColor: _overrideFloactingActionButtonTheme.foregroundColor,
      tooltip: 'Share',
      child: const Icon(AppIcons.share),
    );
  }

  Widget save() {
    return FloatingActionButton(
      onPressed: null,
      backgroundColor: _overrideFloactingActionButtonTheme.backgroundColor,
      foregroundColor: _overrideFloactingActionButtonTheme.foregroundColor,
      tooltip: 'Save',
      child: const Icon(AppIcons.save),
    );
  }

  Widget search() {
    return FloatingActionButton(
      onPressed: null,
      backgroundColor: _overrideFloactingActionButtonTheme.backgroundColor,
      foregroundColor: _overrideFloactingActionButtonTheme.foregroundColor,
      tooltip: 'Search',
      child: const Icon(AppIcons.search),
    );
  }

  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _buttonColor.value,
      foregroundColor: isOpened
          ? Theme.of(context).backgroundColor
          : Theme.of(context).primaryColor,
      onPressed: animate,
      tooltip: 'Toggle',
      child: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: _animateIcon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 4.0,
            0.0,
          ),
          child: share(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 3.0,
            0.0,
          ),
          child: save(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            0.0,
          ),
          child: search(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value,
            0.0,
          ),
          child: formation(),
        ),
        toggle(),
      ],
    );
  }
}
