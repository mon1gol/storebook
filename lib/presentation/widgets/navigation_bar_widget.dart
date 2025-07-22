import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Главная'),
        NavigationDestination(icon: Icon(Icons.star), label: 'Избранное'),
        NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Настройки'),
      ],
      selectedIndex: 0,
      onDestinationSelected: (value) {
        if(value == 1){
          Navigator.of(context).pushNamed('/favorites');
        }
      },
    );
  }
}