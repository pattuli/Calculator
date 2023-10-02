import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import 'package:calculator/controller/calculator_controller.dart';
import 'package:calculator/widget/button.dart';

CalculatorController controller = Get.put(CalculatorController());

class HomePage extends StatelessWidget {
  final List<String> text = [
    "C",
    "DEL",
    "%",
    "/",
    "9",
    "8",
    "7",
    "x",
    "6",
    "5",
    "4",
    "-",
    "3",
    "2",
    "1",
    "+",
    "0",
    ".",
    "=",
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Calculator',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          GetBuilder<CalculatorController>(builder: (context) {
            return outputsection(controller);
          }),
          inputsection(controller),
        ],
      ),
    );
  }

  Expanded inputsection(CalculatorController controller) {
    return Expanded(
        flex: 2,
        child: Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: GridView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: text.length,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return Button(
                      buttontapped: () {
                        controller.clearinput();
                      },
                      text: text[index]);

                /// DELETE BTN
                case 1:
                  return Button(
                      buttontapped: () {
                        controller.delete();
                      },
                      text: text[index]);

                /// EQUAL BTN
                case 18:
                  return Button(
                      buttontapped: () {
                        controller.equalpressed();
                      },
                      text: text[index]);

                default:
                  return Button(
                      buttontapped: () {
                        controller.butnpressed(text, index);
                      },
                      text: text[index]);
              }
            },
          ),
        ));
  }

  Expanded outputsection(CalculatorController controller) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(right: 20, top: 70),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              controller.userinput,
              style: TextStyle(
                  color: Colors.black,
                  // themeController.isDark ? Colors.white : Colors.black,
                  fontSize: 25),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(controller.output,
                style: TextStyle(
                    color: Color.fromARGB(255, 211, 8, 8), fontSize: 32)),
          ),
        ],
      ),
    ));
  }
}
