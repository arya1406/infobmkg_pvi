import 'dart:math';

import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.27,
          height: MediaQuery.of(context).size.width * 0.27,
          child: Transform.rotate(
            angle: pi / 4,
            child: Material(
              color: Color(0xfffffc00),
              borderRadius: BorderRadius.circular(16),
              shadowColor: Colors.grey,
              elevation: 10,
              child: Transform.rotate(
                  angle: -pi / 4,
                  child: Image(image: AssetImage("images/air_pollute.png"))),
            ),
          ),
        )
      ],
    );
  }
}
