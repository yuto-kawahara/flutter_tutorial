import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/notifier.dart';

class WBottomNavigationBar extends ConsumerWidget {
  WBottomNavigationBar({Key? key}) : super(key: key);

  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);

    void _onItemTapped(int index) {
      ref.read(selectedIndexProvider.notifier).update((state) => state = index);
    }

    return BottomNavigationBar(
      currentIndex: selectedIndex,
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
