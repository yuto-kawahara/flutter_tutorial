import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/pages/counter_page.dart';

// class WBottomNavigationBar extends StatefulWidget {
//   Widget build(BuildContext context) {
//     return BottomNavigationBarStatefulWidget();
//   }
// }

class WBottomNavigationBar extends ConsumerWidget {
  // BottomNavigationBarStatefulWidget({Key? key}) : super(key: key);

  int _selectedIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _currentScreens = [
    CounterPage(),
    Center(child: Text('Hello business')),
    Center(child: Text('Hello school')),
    Center(child: Text('Hello settings')),
  ];
  void _onItemTapped(int index) {
    _selectedIndex = index;
  }

  Widget build(BuildContext context, WidgetRef ref) {
    _pageController.animateToPage(_selectedIndex,
        duration: const Duration(milliseconds: 150), curve: Curves.easeInOut);

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          activeIcon: Icon(Icons.book_online),
          label: 'Book',
          tooltip: "This is a Book Page",
          backgroundColor: Color.fromARGB(255, 43, 43, 43),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          activeIcon: Icon(Icons.business_center),
          label: 'Business',
          tooltip: "This is a Business Page",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          activeIcon: Icon(Icons.school_outlined),
          label: 'School',
          tooltip: "This is a School Page",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          activeIcon: Icon(Icons.settings_accessibility),
          label: 'Settings',
          tooltip: "This is a Settings Page",
        ),
      ],
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
    );
  }
}
