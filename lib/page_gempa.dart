import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'home.dart';
import 'package:vibration/vibration.dart';

class GempaPage extends StatefulWidget {
  final List dataGempa;
  GempaPage({Key? key, required this.dataGempa}) : super(key: key);

  @override
  _GempaPageState createState() => _GempaPageState();
}

class _GempaPageState extends State<GempaPage> {
  String bahasa = 'id-ID';
  late String teksGempa;
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
              child: const Text('GEMPA',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'fauna one',
                      fontSize: 45,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: 5,
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
                            teksGempa = 'gempa berkekuatan ' +
                                widget.dataGempa[index][0].toString() +
                                ' Magnitudo, pada ' +
                                widget.dataGempa[index][1].toString() +
                                ' jam ' +
                                widget.dataGempa[index][2]
                                    .toString()
                                    .substring(0, 5) +
                                widget.dataGempa[index][2]
                                    .toString()
                                    .substring(9) +
                                ',di  ' +
                                widget.dataGempa[index][3]
                                    .toString()
                                    .substring(0, 6) +
                                ' ' +
                                widget.dataGempa[index][3]
                                    .toString()
                                    .substring(6) +
                                ' ,' +
                                widget.dataGempa[index][4].toString() +
                                ' kilometer dari anda, ' +
                                widget.dataGempa[index][5]
                                    .toString()
                                    .substring(0, 6) +
                                widget.dataGempa[index][5]
                                    .toString()
                                    .substring(6) +
                                ',';
                            await flutterTts.speak(teksGempa);
                          },
                          child: ExcludeSemantics(
                            child: Text(
                                'gempa berkekuatan ' +
                                    widget.dataGempa[index][0].toString() +
                                    ' Magnitudo,\n pada ' +
                                    widget.dataGempa[index][1].toString() +
                                    ' jam ' +
                                    widget.dataGempa[index][2].toString() +
                                    ' di  ' +
                                    widget.dataGempa[index][3].toString() +
                                    ', ' +
                                    widget.dataGempa[index][4].toString() +
                                    ' KM dari anda, ' +
                                    widget.dataGempa[index][5].toString() +
                                    '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'fauna one',
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
