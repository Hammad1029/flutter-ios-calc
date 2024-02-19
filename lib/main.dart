import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const operatorColor = Color(0xff272727);
const buttonColor = Color(0xff191919);
const orangeColor = Color(0xffD9802E);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double op1 = 0.0;
  String show = "";
  String operation = "";

  _setOp1(val) {
    setState(() {
      op1 = val;
    });
  }

  _setShow(val) {
    setState(() {
      show = val;
    });
  }

  _setOperation(val) {
    setState(() {
      operation = val;
    });
  }

  reset() {
    _setOp1(0.0);
    _setShow("");
    _setOperation("");
  }

  onClick(value) {
    switch (value) {
      case "AC":
        reset();
        break;
      case "÷":
      case "x":
      case "-":
      case "+":
      case "%":
        _setOperation(value);
        _setOp1(double.parse(show));
        _setShow("");
        break;
      case "+/-":
        break;
      case "=":
        double op2 = double.parse(show);
        switch (operation) {
          case "÷":
            _setOp1(op1 / op2);
            break;
          case "x":
            _setOp1(op1 * op2);
            break;
          case "-":
            _setOp1(op1 - op2);
            break;
          case "+":
            _setOp1(op1 + op2);
            break;
          case "%":
            _setOp1(op1 % op2);
            break;
        }
        show = op1.toString();
        break;
      default:
        _setShow(show + value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  show,
                  style: const TextStyle(fontSize: 48, color: Colors.white),
                ),
                const SizedBox(height: 20),
              ]),
        )),
        Row(
          children: [
            button(text: "AC", bgColor: Colors.grey, color: Colors.black),
            button(text: "+/-", bgColor: Colors.grey, color: Colors.black),
            button(text: "%", bgColor: Colors.grey, color: Colors.black),
            button(text: "÷", bgColor: orangeColor, color: Colors.white),
          ],
        ),
        Row(
          children: [
            button(text: "7", bgColor: operatorColor, color: Colors.white),
            button(text: "8", bgColor: operatorColor, color: Colors.white),
            button(text: "9", bgColor: operatorColor, color: Colors.white),
            button(text: "x", bgColor: orangeColor, color: Colors.white),
          ],
        ),
        Row(
          children: [
            button(text: "4", bgColor: operatorColor, color: Colors.white),
            button(text: "5", bgColor: operatorColor, color: Colors.white),
            button(text: "6", bgColor: operatorColor, color: Colors.white),
            button(text: "-", bgColor: orangeColor, color: Colors.white),
          ],
        ),
        Row(
          children: [
            button(text: "1", bgColor: operatorColor, color: Colors.white),
            button(text: "2", bgColor: operatorColor, color: Colors.white),
            button(text: "3", bgColor: operatorColor, color: Colors.white),
            button(text: "+", bgColor: orangeColor, color: Colors.white),
          ],
        ),
        Row(
          children: [
            button(
                text: "0",
                bgColor: operatorColor,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                flex: 5,
                bottomMargin: 8),
            button(
                text: ".",
                bgColor: operatorColor,
                color: Colors.white,
                bottomMargin: 8),
            button(
                text: "=",
                bgColor: orangeColor,
                color: Colors.white,
                bottomMargin: 8),
          ],
        )
      ],
    ));
  }

  Widget button(
      {text,
      color = Colors.white,
      bgColor = buttonColor,
      shape = const CircleBorder(),
      flex = 2,
      bottomMargin = 4}) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.fromLTRB(6, 4, 6, bottomMargin + 0.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: shape,
              padding: const EdgeInsets.all(15),
              backgroundColor: bgColor,
            ),
            onPressed: () => onClick(text),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18, color: color, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
