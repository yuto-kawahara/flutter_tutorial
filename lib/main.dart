import 'dart:convert';
import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:myapp/notifier.dart';
import 'package:myapp/pages/count_page.dart';
import 'package:myapp/pages/page_todo_add.dart';
import 'package:myapp/uiparts/appBar/w_app_bar.dart';
import 'package:myapp/uiparts/bottomNavigationBar/w_bottom_navigation_bar.dart';

void main() {
  runApp(ProviderScope(
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  final List<Widget> _currentScreens = [
    CountPage(),
    Center(child: Text('Hello business')),
    Center(child: Text('Hello school')),
    Center(child: Text('Hello settings')),
  ];

  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Here we take the value from the MyHomePage object that was created by
    final selectedIndex = ref.watch(selectedIndexProvider);

    if (_pageController.hasClients) {
      _pageController.animateToPage(selectedIndex,
          duration: const Duration(milliseconds: 150), curve: Curves.easeInOut);
    }
    return Scaffold(
      appBar: WAppBar(title: this.title),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _currentScreens,
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: WBottomNavigationBar(),
    );
  }
}
