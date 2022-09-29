import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

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
  String expression = "", result = "", precedentValue = "";

  void onTap(String value) {
    expression += value;
    precedentValue = value;
    setState(() {});
  }

  //Click sur les touches opérateur
  void onOperatorButtonTap(String value) {
    if (!["+", "-", "/", "*" , "%"].contains(precedentValue)) {
      expression += value;
      precedentValue = value;
    }

    setState(() {});
  }

  //Click sur la touche égale
  void onEqualButtonTap(String value) {
    result = expression.interpret().toString();
    if (precedentValue == "=") {
      expression = "";
    }

    precedentValue = value;
    setState(() {});
  }

  //Click sur la touche C pour efface le dernier caractere
  void onClearButtonTap(String value) {

    if (expression.length > 1) {
      expression = expression.substring(0, expression.length - 1);
      try {
        result = expression.interpret().toString();
      }catch (e) {
        // TODO
      }

    } else {
      expression = "";
      result = "";
    }
    precedentValue = value;
    setState(() {});
  }

  //Long click sur la touche C pour tout éffacer
  void onClearLongPress(String value) {
    expression = "";
    result = "";
    precedentValue = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //Ecran expression et resultat
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 55),
                Container(
                  height: 60,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    child: Text(
                      "$expression",
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w200),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$result",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          //Clavier du calculateur
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                //Debut clavier scientifique
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(
                      height: 30,
                      text: "sin",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("sin("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "cos",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("cos("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "tan",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("tan("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "asin",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("asin("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "acos",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("acos("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "atan",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("atan("),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(
                      height: 30,
                      text: "floor",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("floor("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "round",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("round("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "sec",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("sec("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "sinh",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("sinh("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "cosh",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("cosh("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "tanh",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("tanh("),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(
                      height: 30,
                      text: "x^y",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("^"),
                    ),
                    CalcButton(
                      height: 30,
                      text: "x^2",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("^2"),
                    ),
                    CalcButton(
                      height: 30,
                      text: "e",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("e"),
                    ),
                    CalcButton(
                      height: 30,
                      text: "ln",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("ln("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "√",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("sqrt("),
                    ),
                    CalcButton(
                      height: 30,
                      text: "π",
                      color: Colors.white12,
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      onTap: () => onTap("pi"),
                    ),
                  ],
                ),
                //Fin clavier scientifique
                //Debut clavier numérique et opérateur
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(
                      flex: 2,
                      text: "C",
                      onTap: () => onClearButtonTap("C"),
                      lonPress: () => onClearLongPress("C"),
                    ),
                    CalcButton(
                      flex: 1,
                      text: "(",
                      color: Colors.white54,
                      onTap: () => onTap("("),
                    ),
                    CalcButton(
                      flex: 1,
                      text: ")",
                      color: Colors.white54,
                      onTap: () => onTap(")"),
                    ),
                    CalcButton(
                      flex: 2,
                      text: "%",
                      color: Colors.orange,
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                      onTap: () => onOperatorButtonTap("%"),
                    ),
                    CalcButton(
                      flex: 2,
                      text: "÷",
                      color: Colors.orange,
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                      onTap: () => onOperatorButtonTap("/"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(text: "7",  color: Colors.white38, onTap: () => onTap("7")),
                    CalcButton(text: "8", color: Colors.white38, onTap: () => onTap("8")),
                    CalcButton(text: "9", color: Colors.white38, onTap: () => onTap("9")),
                    CalcButton(
                        text: "X",
                        color: Colors.orange,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        onTap: () => onOperatorButtonTap("*")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(text: "4", color: Colors.white38, onTap: () => onTap("4")),
                    CalcButton(text: "5", color: Colors.white38, onTap: () => onTap("5")),
                    CalcButton(text: "6", color: Colors.white38, onTap: () => onTap("6")),
                    CalcButton(
                        text: "-",
                        color: Colors.orange,
                        fontWeight: FontWeight.normal,
                        fontSize: 40,
                        onTap: () => onOperatorButtonTap("-")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(text: "1",color: Colors.white38, onTap: () => onTap("1")),
                    CalcButton(text: "2", color: Colors.white38, onTap: () => onTap("2")),
                    CalcButton(text: "3", color: Colors.white38, onTap: () => onTap("3")),
                    CalcButton(
                        text: "+",
                        color: Colors.orange,
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        onTap: () => onOperatorButtonTap("+")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalcButton(flex: 2, text: "0", color: Colors.white38, onTap: () => onTap("0")),
                    CalcButton(text: ",", color: Colors.white38,onTap: () => onTap(".")),
                    CalcButton(
                        text: "=",
                        color: Colors.orange,
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                        onTap: () => onEqualButtonTap("=")),
                  ],
                ),
                //Fin clavier numérique et opérateur
              ],
            ),
          )
        ],
      ),
    );
  }
}

//Widget bouton de calculatrice
class CalcButton extends StatelessWidget {
  double height;
  int flex;
  Color color;
  String text;
  double fontSize;
  FontWeight fontWeight;
  Function()? onTap, lonPress;

  CalcButton(
      {Key? key,
      this.height = 55,
      this.flex = 1,
      this.color = Colors.white70,
      required this.text,
      this.fontSize = 23,
      this.fontWeight = FontWeight.bold,
      this.onTap,
      this.lonPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      flex: flex,
      child: Container(
        height: height,
        width: 55,
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
          //shape: BoxShape.circle,,
          borderRadius: BorderRadius.circular(100), color: color,
        ),
        child: InkWell(
          onTap: onTap,
          onLongPress: lonPress,
          child: Center(
            child: Text(
              "$text",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: fontWeight,
                  fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
