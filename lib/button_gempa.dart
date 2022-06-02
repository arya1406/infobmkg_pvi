import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:infobmkg_pvi/page_gempa.dart';
import 'package:infobmkg_pvi/home.dart';
import 'package:vibration/vibration.dart';

class ButtonGempa extends StatefulWidget {
  final List dataGempa;
  ButtonGempa({Key? key, required this.dataGempa}) : super(key: key);

  @override
  _ButtonGempaState createState() => _ButtonGempaState();
}

class _ButtonGempaState extends State<ButtonGempa> {
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
        child: Semantics(
          container: true,
          label: 'informasi gempa bumi',
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(30, 10, 30, 5),
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: (isPressed) ? Colors.grey : Color(0xfffffc00),
                borderRadius: BorderRadius.circular(51),
                border: Border.all(color: Colors.black, width: 1.5)),
            child: InkWell(
              onTap: () async {
                if (await Vibration.hasVibrator() ?? false) {
                  Vibration.vibrate(duration: 100);
                }

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GempaPage(
                        dataGempa: widget.dataGempa,
                      ),
                    ));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 4,
                      child: Image(image: AssetImage('images/earthquake.png'))),
                  const ExcludeSemantics(
                    child: Text(
                      'GEMPA',
                      style: TextStyle(
                          fontFamily: 'fauna one',
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
