import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String infoText = 'Type your data';

  void resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      infoText = 'Type your data';
      formKey = GlobalKey<FormState>();
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if (imc < 18.6) {
        infoText =
            'Underweight detected! Your IMC is = ${imc.toStringAsPrecision(4)}';
      } else if (imc >= 18.6 && imc < 24.9) {
        infoText =
            'Ideal weight detected! Your IMC is = ${imc.toStringAsPrecision(4)}';
      } else if (imc >= 24.9 && imc < 29.9) {
        infoText =
            'Sligthly overweight detected! Your IMC is = ${imc.toStringAsPrecision(4)}';
      } else if (imc >= 29.9 && imc < 34.9) {
        infoText =
            'Overweight I detected! Your IMC is = ${imc.toStringAsPrecision(4)}';
      } else if (imc >= 34.9 && imc < 39.9) {
        infoText =
            'Overweight II detected! Your IMC is = ${imc.toStringAsPrecision(4)}';
      } else if (imc >= 40) {
        infoText =
            'Overweight III detected! Your IMC is = ${imc.toStringAsPrecision(4)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC Calculator'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
              onPressed: () {
                resetFields();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.person_outline,
                    size: 120.0, color: Colors.green),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Weight (kg)',
                      labelStyle: TextStyle(color: Colors.green)),
                  style: const TextStyle(color: Colors.green, fontSize: 25.0),
                  controller: weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insert your weight';
                    } else{
                      return null;
                    }
                    
                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Height (cm)',
                      labelStyle: TextStyle(color: Colors.green)),
                  style: const TextStyle(color: Colors.green, fontSize: 25.0),
                  controller: heightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Insert your weight';
                    } else{
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        calculate();
                      }
                    },
                    child: Text('Calculate'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(0, 255, 0, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                  ),
                ),
                Text(infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0)),
              ],
            ),
          )),
    );
  }
}
