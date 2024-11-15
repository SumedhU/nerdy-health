import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

import 'package:nerdy_health/routing/app_route.dart';
import 'package:nerdy_health/routing/app_router.dart';

///
/// A "shell" screen used as a frame around other screens.
///
class HomeScreen extends ConsumerStatefulWidget {
  final Widget child;

  const HomeScreen({required this.child, super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<MenuItem> menu = [
    MenuItem(
      path: AppRoute.landing.path,
      icon: const HeroIcon(
        HeroIcons.home,
      ),
      label: "Landing",
    ),
    MenuItem(
        path: AppRoute.log.path,
        icon: const HeroIcon(
          HeroIcons.bookOpen,
        ),
        label: "Log"),
    MenuItem(
      path: AppRoute.profile.path,
      icon: const HeroIcon(
        HeroIcons.user,
      ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _navigationBar,
    );
  }

  Widget get _navigationBar {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 6.0,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.black,
      onTap: (index) => _onItemTapped(context, index),
      items: menu.map((item) {
        return BottomNavigationBarItem(
          icon: Container(
            padding: const EdgeInsets.all(8.0),
            child: item.icon,
          ),
          label: item.label,
        );
      }).toList(),
    );
  }

  int get _selectedIndex {
    final location = GoRouter.of(context).location;
    final index = menu.indexWhere((item) => item.path.startsWith(location));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int index) {
    if (index != _selectedIndex) {
      final menuItem = menu[index];
      context.go(menuItem.path);
    }
  }
}

///
/// A menu item used for selecting a screen.
///
class MenuItem extends BottomNavigationBarItem {
  final String path;
  const MenuItem({
    required this.path,
    required super.icon,
    super.label,
  });
}
