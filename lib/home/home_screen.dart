import 'package:flutter/material.dart';
import 'package:myapp/home/home_content.dart';
import 'package:myapp/home/job_ask.dart';
import 'package:myapp/home/message_screen.dart';
import 'package:myapp/home/notification_screen.dart';

import 'package:myapp/widget/appbar.dart';
import 'package:myapp/widget/drawer.dart';

import 'package:myapp/models/user_model.dart'; // Importez votre modèle User

class JobHomePage extends StatefulWidget {
  final User user; // Ajoutez cette ligne pour inclure l'utilisateur

  const JobHomePage({super.key, required this.user}); // Modifiez le constructeur

  @override
  State<JobHomePage> createState() => _JobHomePageState();
}

class _JobHomePageState extends State<JobHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const MessageScreen(),
    const NotificationScreen(),
    const JobAsk(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(_currentIndex, context, widget.user), // Passez l'utilisateur ici
      drawer: _currentIndex == 0 ? const DrawerWidget() : null,
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
        ],
      ),
    );
  }
}