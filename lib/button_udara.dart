import 'package:infobmkg_pvi/page_udara.dart';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class ButtonUdara extends StatefulWidget {
  final List dataUdara;
  ButtonUdara({Key? key, required this.dataUdara}) : super(key: key);

  @override
  _ButtonUdaraState createState() => _ButtonUdaraState();
}

class _ButtonUdaraState extends State<ButtonUdara> {
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
        label: 'informasi kualitas udara',
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

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UdaraPage(dataUdara: widget.dataUdara);
              }));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Image(image: AssetImage('images/air.png'))),
                const ExcludeSemantics(
                  child: Text(
                    'KUALITAS UDARA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'fauna one',
                        fontSize: 35,
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
