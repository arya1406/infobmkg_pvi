import 'package:flutter_tts/flutter_tts.dart';

import 'home.dart';
import 'package:flutter/material.dart';
import 'page_cuaca.dart';
import 'package:vibration/vibration.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class ButtonCuaca extends StatefulWidget {
  final List dataCuaca;
  final List dataKota;
  ButtonCuaca({Key? key, required this.dataCuaca, required this.dataKota})
      : super(key: key);
  @override
  _ButtonCuacaState createState() => _ButtonCuacaState();
}

class _ButtonCuacaState extends State<ButtonCuaca> {
  TtsState ttsState = TtsState.stopped;
  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  stt.SpeechToText speech = stt.SpeechToText();
  final FlutterTts flutterTts = FlutterTts();

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
        label: 'informasi chuacha',
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
              speech.stop();
              if (await Vibration.hasVibrator() ?? false) {
                Vibration.vibrate(duration: 100);
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageCuaca(
                  dataCuaca: widget.dataCuaca,
                  dataKota: widget.dataKota,
                );
              }));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: Image(image: AssetImage('images/weather.png'))),
                const ExcludeSemantics(
                  child: Text(
                    'CUACA',
                    style: TextStyle(
                        fontFamily: 'fauna one',
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
