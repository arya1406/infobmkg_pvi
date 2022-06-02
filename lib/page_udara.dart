import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:vibration/vibration.dart';
import 'home.dart';

class UdaraPage extends StatefulWidget {
  final List dataUdara;

  UdaraPage({Key? key, required this.dataUdara}) : super(key: key);

  @override
  _UdaraPageState createState() => _UdaraPageState();
}

class _UdaraPageState extends State<UdaraPage> {
  String bahasa = 'id-ID';
  late String teksUdara;
  dynamic languages;
  late String language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  late String newVoiceText;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  stt.SpeechToText speech = stt.SpeechToText();
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBar(
                backgroundColor: Color(0xfffffc00),
                title: Container(
                  alignment: Alignment.center,
                  child: const Text('Kualitas Udara',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'fauna one',
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            body: ListView.builder(
                itemCount: widget.dataUdara.length ~/ 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Semantics(
                        container: true,
                        label: 'klik dua kali untuk informasi',
                        child: ExcludeSemantics(
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 10),
                            padding: EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color(0xfffffc00),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: InkWell(
                              onTap: () async {
                                if (await Vibration.hasVibrator() ?? false) {
                                  Vibration.vibrate(duration: 100);
                                }

                                speech.stop();
                                flutterTts.setLanguage(bahasa);
                                await flutterTts.setPitch(pitch);
                                teksUdara = 'Kualitas Udara di wilayah ' +
                                    widget.dataUdara[index][0]
                                        .toString()
                                        .substring(0, 4) +
                                    widget.dataUdara[index][0]
                                        .toString()
                                        .substring(4) +
                                    widget.dataUdara[index +
                                            widget.dataUdara.length ~/ 2][0]
                                        .toString();
                                await flutterTts.speak(teksUdara);
                              },
                              child: ExcludeSemantics(
                                child: Text(
                                    'Kualitas Udara di wilayah \n ' +
                                        widget.dataUdara[index][0].toString() +
                                        ' ' +
                                        widget.dataUdara[index +
                                                widget.dataUdara.length ~/ 2][0]
                                            .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 21,
                                        fontFamily: 'fauna one',
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })));
  }
}
