import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  final Function(int currentIndex) onTap;
  final List<BottomNavigationBarItem> items;

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.items,
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).backgroundColor,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    widget.onTap(index);

    setState(() {
      _selectedIndex = index;
    });
  }
}
