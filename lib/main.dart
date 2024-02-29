import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightController = TextEditingController();
  var heightInFeetController = TextEditingController();
  var heightInInchController = TextEditingController();
  var result = "";

  void onPressed() {
    var weight = weightController.text.toString();
    var heightInFeet = heightInFeetController.text.toString();
    var heightInInch = heightInInchController.text.toString();

    if (weight != "" && heightInFeet != "" && heightInInch != "") {
      // BMI Calculation
      var height =
          (double.parse(heightInFeet) * 12) + double.parse(heightInInch);
      var heightInMeters = height * 0.0254;
      var weightInDouble = double.parse(weight);
      var bmi = weightInDouble / (heightInMeters * heightInMeters);
      var msg = "";

      if (bmi > 25) {
        msg = "You are overweight";
        bgColor = Colors.red.shade200;
        textColor = const Color.fromARGB(255, 163, 10, 10);
      } else if (bmi < 18) {
        msg = "You are underweight";
        bgColor = Colors.red.shade200;
        textColor = const Color.fromARGB(255, 163, 10, 10);
      } else {
        msg = "You are normal";
        bgColor = const Color.fromARGB(255, 153, 221, 155);
        textColor = Colors.green.shade900;
      }
      setState(() {
        result = "Your BMI is: ${bmi.toStringAsFixed(2)} \n $msg";
      });
    } else {
      setState(() {
        result = "Please enter all the fields";
        textColor = Colors.red.shade400;
      });
    }
  }

  //changing color on basis of BMI
  var bgColor = Colors.indigo.shade100;
  var textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontFamily: "JetBrainsMonoNL",
              fontWeight: FontWeight.bold,
              letterSpacing: 2),
        )),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "BMI ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    labelText: "Weight",
                    hintText: "Enter your weight in kgs",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: heightInFeetController,
                  decoration: const InputDecoration(
                    labelText: "Feet",
                    hintText: "Enter your height in feet",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    prefixIcon: Icon(Icons.height_rounded),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: heightInInchController,
                  decoration: const InputDecoration(
                    labelText: "Inches",
                    hintText: "Enter your height in inches",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                    prefixIcon: Icon(Icons.height_rounded),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text('Calculate BMI'),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  result,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
