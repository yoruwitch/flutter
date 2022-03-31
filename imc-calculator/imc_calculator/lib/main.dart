import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home()
    ,
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC Calculator'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    );
  }
}
