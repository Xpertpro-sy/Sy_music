import 'package:flutter/material.dart';

import '../common/color_extention.dart';
import '../pages/AccueilPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Juste pour l'exemple, on définit 5 pages ou sections
  final List<Widget> _pages = [
    Center(child: AccueilPage()),
    Center(child: Text('Notifications')),
    Center(child: Text('Bouton central')),
    //Center(child: Text('Documents')),
    Center(child: Text('Profil')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Corps principal qui change selon l'index sélectionné
      body: _pages[_currentIndex],
      // On définit ici le FAB (FloatingActionButton) qui apparaîtra au centre
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Si tu veux que le FAB ouvre une page particulière,
      //     // tu peux gérer ici la navigation ou le setState
      //     _onItemTapped(2);
      //   },
      //   backgroundColor: Colors.green,
      //   child: const Icon(Icons.apps), // Remplace par l’icône souhaitée
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Définition du BottomAppBar pour créer un style de Bottom Nav personnalisé
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: TColor.focus,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: 10, fontWeight: FontWeight.bold), // Taille du texte sélectionné
          unselectedLabelStyle: TextStyle(fontSize: 9),
          //backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          backgroundColor: TColor.bg,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Mon espace',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: 'Central',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.description),
            //   label: 'Documents',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
    );
  }
}

// TuneShop