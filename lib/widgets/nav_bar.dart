import 'package:colipar/styles/colors.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/multi_step_form.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0; 
  final List<Widget> _children = [
    const HomePage(),
    ColisScreen(),
    const MultiStepForm(),
    AnnonceScreen(),
    ProfileScreen(),
    
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.gray,
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          _buildNavItem(Icons.home_outlined),
          _buildNavItem(Icons.inventory_2_outlined),
          _buildCenterNavItem(),
          _buildNavItem(Icons.file_copy_outlined),
          _buildNavItem(Icons.person_outlined),
        ],  
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
    );
  }

  

  BottomNavigationBarItem _buildNavItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon,size: 25,),
      label: '',

    );
  }

  BottomNavigationBarItem _buildCenterNavItem() {
    return BottomNavigationBarItem(
      backgroundColor: AppColors.backgroundWhite,
      icon: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.blue,
        ),
        child: Icon(Icons.add, size: 40, color: Colors.white), 
      ),
      label: '', 
    );
  }

}

class ColisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Colis Screen'),
    );
  }
}


class AnnonceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('annonce Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

class NewAnnounce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('nouvelle annonce Screen'),
    );
  }
}