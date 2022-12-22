import 'package:flutter/material.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({Key? key, required this.title}) : super(key: key);

  final String title;
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Color.fromARGB(255, 43, 43, 43),
    );
  }
}
