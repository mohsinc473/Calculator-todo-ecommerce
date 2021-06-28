import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    var textController = new TextEditingController();

    Widget btn(var btnName) {
      return OutlinedButton(
        onPressed: () {
          textController.text += btnName;
        },
        child: Text(
          btnName,
          style: TextStyle(fontSize: 30),
        ),
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
            minimumSize: Size(100.0, 100.0),
            primary: Colors.teal[900],
            side: BorderSide(color: Colors.blueGrey)),
      );
    }

    result() {
      String res = textController.text;
      Parser p = Parser();
      Expression exp = p.parse(res);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      print(eval);
      textController.text = eval.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(fontSize: 20.0, height: 5),
              // autofocus: true,
              controller: textController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Evaluate Your Expression'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      textController.text = "";
                    },
                    child: Text(
                      "C",
                      style: TextStyle(fontSize: 30),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(10.0),
                        minimumSize: Size(100.0, 100.0),
                        primary: Colors.deepOrange[900],
                        side: BorderSide(color: Colors.blueGrey)),
                  ),
                  btn("/"),
                  btn("*"),
                  OutlinedButton(
                    onPressed: () {
                      textController.text = textController.text
                          .substring(0, textController.text.length - 1);
                    },
                    child: Icon(
                      Icons.backspace_rounded,
                      color: Colors.deepOrange[900],
                      size: 30.0,
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(10.0),
                        minimumSize: Size(100.0, 100.0),
                        primary: Colors.deepOrange[900],
                        side: BorderSide(color: Colors.blueGrey)),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("7"),
                btn("8"),
                btn("9"),
                btn("-"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("4"),
                btn("5"),
                btn("6"),
                btn("+"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                btn("1"),
                btn("2"),
                btn("3"),
                btn("."),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                btn("0"),
                OutlinedButton(
                  onPressed: result,
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 30),
                  ),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(10.0),
                      minimumSize: Size(291.0, 100.0),
                      primary: Colors.cyan[800],
                      side: BorderSide(color: Colors.blueGrey)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
