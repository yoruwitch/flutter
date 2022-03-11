import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void decrement() {
    print('Decrement');
  }

  void increment() {
    print('Increment');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Pode entrar',
          style: TextStyle(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 32,
        ),
        const Text('0', style: TextStyle(fontSize: 100, color: Colors.white)),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: decrement,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text(
                  'saiu',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
            const SizedBox(
              width: 64,
            ),
            TextButton(
                onPressed: increment,
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(100, 100),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                // ignore: prefer_const_constructors
                child: Text(
                    // ignore: prefer_const_constructors
                    'entrou',
                    style: const TextStyle(color: Colors.black, fontSize: 16)))
          ],
        ),
      ]),
    );
  }
}
