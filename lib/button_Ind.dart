import 'package:flutter/material.dart';
import 'home.dart';

class ButtonIndo extends StatefulWidget {
  @override
  _ButtonIndoState createState() => _ButtonIndoState();
}

class _ButtonIndoState extends State<ButtonIndo> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          //isPressed = !isPressed;
        });
      },
      onTapUp: (details) {
        setState(() {
          isPressed = !isPressed;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Semantics(
        container: true,
        label: 'bahasa indonesia',
        child: Container(
          width: 279,
          height: 146,
          margin: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: (isPressed) ? Colors.grey : Color(0xfffffc00),
              border: Border.all(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.circular(29)),
          child: InkWell(
            onTap: () {},
            child: const Text('Indonesia',
                style: TextStyle(
                    fontFamily: 'Museo Moderno',
                    fontSize: 48,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
