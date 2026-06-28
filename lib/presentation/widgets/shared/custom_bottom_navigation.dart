import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex; 
  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index){
    context.go('home/$index');
  }
  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) => onItemTapped(context, value),
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
    );
  }
}