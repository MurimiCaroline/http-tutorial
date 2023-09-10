

import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  double boxHeight = 100;
  //MediaQuery.sizeOf(context).width
  double boxWidth = 100;
  Color boxColor = Colors.amberAccent;
  final BorderRadius _borderRadius =  BorderRadius.circular(8);
   void _changeBoxSixe (){
    setState(() {
      boxWidth = random.nextInt(400).toDouble();
      boxHeight = random.nextInt(400).toDouble();
    });
   }
    void _changeBoxColor (){
      setState(() {
        boxColor = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256),1);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          height: boxHeight,
           width: boxWidth,
           decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: _borderRadius,
           ),
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }
}