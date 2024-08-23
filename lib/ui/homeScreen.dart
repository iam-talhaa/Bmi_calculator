import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightCOntroller = TextEditingController();
  double height_value = 0.0;
  double weight_value = 0.0;

  void H_Conversion() {
    try {
      double height_controller = double.parse(_heightController.text);
      double weight_controller = double.parse(_weightCOntroller.text);
      setState(() {
        height_value = height_controller;
        weight_value = weight_controller;
        print(height_value);
        print(weight_value);
      });
    } catch (e) {
      // Handle parsing errors (e.g., non-numeric input)
      print('Error parsing double: $e');
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      maxLines: 3,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Enter your Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _heightController,
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Height [inches]",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
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
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('P_name', _nameController.text);
                await prefs.setString('P_height', _heightController.text);
                await prefs.setString('P_weight', _weightCOntroller.text);

                String? p_name = prefs.getString('P_name');
                String? p_height = prefs.getString('P_height');
                String? p_wight = prefs.getString('P_weight');

                // print(p_name);
                // print(p_wight);
                // print(p_height);
                setState(() {});

                H_Conversion();
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff00416A), Color(0xffE4E5E6)]),
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
            Container(
              height: 170,
              width: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff9796f0), Color(0xfffbc7d4)]),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("NAME :${_nameController.text.toUpperCase()}"),
                  Text("Height[inches] :${height_value}"),
                  Text("Weight[kg] :${weight_value}")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
