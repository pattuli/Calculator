import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var userinput = '';
  var output = '';

  equalpressed() {
    String userinputfinal = userinput;
    userinputfinal = userinputfinal.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(userinputfinal);
    ContextModel cm = ContextModel(); //object creation
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    output = eval.toString();
    update();
  }

  delete() {
    userinput = userinput.substring(0, userinput.length - 1);
    update();
  }

  clearinput() {
    userinput = '';
    output = '';
    update();
  }

  butnpressed(List<String> button, int index) {
    userinput = userinput + button[index];
    update();
  }
}
