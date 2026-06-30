import 'package:cinemapedia/presentation/views/movies/favorites_view.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../views/movies/home_view.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final int pageIndex;
  final viewRoutes = const <Widget>[
    HomeView(),
    FavoritesView(),
  ];
  const HomeScreen({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = pageIndex == 2 ? 1 : pageIndex.clamp(0, 1);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: selectedIndex,
      ),
    );
  }
}

