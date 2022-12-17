import 'package:flutter/material.dart';

class PageTodoAdd extends StatefulWidget {
  const PageTodoAdd({super.key});
  State<PageTodoAdd> createState() => _PageTodoAddState();
}

class _PageTodoAddState extends State<PageTodoAdd> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          // ボタンをクリックした時の処理
          onPressed: () {
            // "pop"で前の画面に戻る
            Navigator.of(context).pop();
          },
          child: Text('リスト追加画面（クリックで戻る）'),
        ),
      ),
    );
  }
}
