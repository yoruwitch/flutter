import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  int count = 0;
  String title = 'Can come in';
  void decrement() {
    setState(() {
      if(count > 0) {
        title = 'Can come in';
        count--;
      }
      
    });
  }

  void increment() {
    setState(() {
      if (count < 20) {
        count++;
      }
      if (count == 20) {
        title = 'The classroom is full';
      }

    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/classroom-blurred.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
             Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 32,
            ),
             Text('$count' ,
              style: const TextStyle(fontSize: 100, color: Colors.white)),
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
                      'Out',
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
                        'In',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)))
              ],
            ),
          ])),
    );
  }
}



