import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _inchesController = TextEditingController();
  TextEditingController _weightCOntroller = TextEditingController();
  TextEditingController _footController = TextEditingController();
  double foot_value = 0.0;
  double inches_value = 0.0;
  double weight_value = 0.0;
  double heightinmeter = 0.0;
  double BMI = 0.0;
  double meterSquare = 0.0;

  List<String> person_name = [];
  List<double> person_height = [];
  List<double> person_weight = [];

  void H_Conversion() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

//
      double inches_controller = double.parse(_inchesController.text);
      double foot_controller = double.parse(_footController.text);
      double weight_controller = double.parse(_weightCOntroller.text);
      setState(() {
        foot_value = foot_controller;
        inches_value = inches_controller;
        weight_value = weight_controller;
      });
      await prefs.setDouble('F_height', foot_value);
      await prefs.setDouble('I_height', inches_value);
      await prefs.setDouble('P_weight', weight_value);
      await prefs.setString('P_name', _nameController.text);
      double heightinmeter = foot_value * 12 + inches_value;
      double meterSquare = heightinmeter * heightinmeter;
      //double BMI = weight_value / meterSquare;

      print("HEIGHT [Feet]   : ${foot_value}");
      print("HEIGHT [inches] : ${inches_value}");
      print('METER HEIGHT    : $heightinmeter');
      print('BMI weight $weight_value');
      print("BMI: ${weight_value / 5}");
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffcc2b5e), Color(0xff753a88)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      maxLines: 3,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: "Name",
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _footController,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Feet",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _inchesController,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "inches",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _weightCOntroller,
                      maxLines: 1,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Weight [kg]",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                H_Conversion();
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff11998e), Color(0xff38ef7d)]),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue),
                  child: Center(
                      child: Text(
                    'Calculate',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  )),
                ),
              ),
            ),
            Card(
              child: Container(
                height: 170,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("NAME   :${_nameController.text.toUpperCase()}"),
                    Divider(),
                    Text("foot:${foot_value}:Inches${inches_value}"),
                    Divider(),
                    Text("Weight[kg]     :${weight_value}"),
                    Divider(),
                    Text('BMI :${weight_value / meterSquare} ')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
