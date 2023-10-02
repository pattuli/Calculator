import 'package:calculator/controller/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

var controller = Get.find<CalculatorController>();

class Button extends StatelessWidget {
  final VoidCallback buttontapped;
  final String text;

  const Button({super.key, required this.buttontapped, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Container(
        margin: EdgeInsets.all(10),
        color: Color.fromARGB(255, 240, 144, 144),
        child: Center(
            child: Text(
          text,
          style:
              TextStyle(color: Color.fromARGB(255, 18, 17, 17), fontSize: 20),
        )),
      ),
    );
  }
}
