import 'package:flutter/material.dart';

import 'package:infobmkg_pvi/page_bahasa.dart';

import 'home.dart';

class ButtonOption extends StatefulWidget {
  @override
  _ButtonOptionState createState() => _ButtonOptionState();
}

class _ButtonOptionState extends State<ButtonOption> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isPressed = !isPressed;
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
      child: new Semantics(
        container: true,
        label: 'menukar bahasa',
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 30),
          height: heightButton,
          width: widthButton,
          decoration: BoxDecoration(
              color: (isPressed) ? Colors.grey : Color(0xfffffc00),
              borderRadius: BorderRadius.circular(51),
              border: Border.all(color: Colors.black, width: 1.5)),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageBahasa();
              }));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage('images/id-en.png')),
                const ExcludeSemantics(
                  child: Text(
                    'BAHASA',
                    style: TextStyle(
                        fontFamily: 'fauna one',
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
