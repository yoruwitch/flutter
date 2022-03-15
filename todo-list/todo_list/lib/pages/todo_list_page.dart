import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              labelText: 'email',
              hintText: 'example@example.com',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}