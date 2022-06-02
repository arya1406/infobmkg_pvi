import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:vibration/vibration.dart';

import 'package:infobmkg_pvi/home.dart';

class TutorialPage extends StatefulWidget {
  final List dataGempa;
  final List dataUdara;
  final List dataCuaca;
  final List dataKota;
  final List dataKotaHome;
  final String position;
  final int intGPS;
  final dynamic indexTime;
  TutorialPage(
      {Key? key,
      required this.dataGempa,
      required this.dataUdara,
      required this.dataCuaca,
      required this.dataKota,
      required this.dataKotaHome,
      required this.intGPS,
      required this.position,
      this.indexTime})
      : super(key: key);

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
  String bahasa = 'id-ID';
  String teksTutorial1 = "selamat datang di info B M K G untuk tunanetra. ";
  String teksTutorial2 =
      "aplikasi ini akan memudahkan anda untuk mendapatkan informasi prakiraan cuaca hari ini dan besok di wilayah anda, gempa terkini diatas 5 magnitudo dan info kualitas udara, ";
  String teksTutorial3 =
      " Halaman utama aplikasi terdapat tombol mikrofon, ketika tombol di klik akan timbul suara klik dan bergetar, kemudian anda bisa bertanya tentang seputar informasi cuaca di tempat anda, gempa dan kualitas udara, ";
  String teksTutorial4 =
      "seperti, gempa yang terkini. atau. polusi udara di wilayah medan. atau. cuaca hari ini gimana ?.";
  String teksTutorial5 =
      " aplikasi akan memberikan informasi yang anda minta dalam bentuk suara. jika anda menslide ke kiri layar, terdapat menu tombol informasi cuaca diwilayah lain, tombol informasi gempa terkini, tombol informasi kualitas udara. Semoga aplikasi ini dapat membantu anda dalam mendapatkan informasi prakiraan cuaca, gempa bumi, dan kualitas udara. tekan tombol skip dibawah untuk masuk ke menu utama.";
  dynamic languages;
  late String language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  late String newVoiceText;
  TtsState ttsState = TtsState.stopped;
  var duration = const Duration(seconds: 2);
  late Timer timer;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;
  stt.SpeechToText speech = stt.SpeechToText();
  final FlutterTts flutterTts = FlutterTts();

  Future _speakTutor1() async {
    speech.stop();
    flutterTts.setLanguage(bahasa);
    flutterTts.setPitch(pitch);
    teksTutorial1 = "selamat datang di info B M K G untuk tunanetra. ";
    teksTutorial2 =
        "aplikasi ini akan memudahkan anda untuk mendapatkan informasi prakiraan cuaca hari ini dan besok di wilayah anda, gempa terkini diatas 5 magnitudo dan info kualitas udara, ";
    flutterTts.speak(teksTutorial1 + teksTutorial2);
  }

  Future _speakTutor2() async {
    flutterTts.setLanguage(bahasa);
    flutterTts.setPitch(pitch);
    teksTutorial3 =
        " Halaman utama aplikasi terdapat tombol mikrofon, ketika tombol di klik akan timbul suara klik dan bergetar, kemudian anda bisa bertanya tentang seputar informasi cuaca di tempat anda, gempa dan kualitas udara, ";
    teksTutorial4 =
        "seperti, gempa yang terkini. atau. polusi udara di wilayah medan. atau. cuaca hari ini gimana ?.";
    flutterTts.speak(teksTutorial3 + teksTutorial4);
  }

  Future _speakTutor3() async {
    flutterTts.setLanguage(bahasa);
    flutterTts.setPitch(pitch);
    teksTutorial5 =
        " aplikasi akan memberikan informasi yang anda minta dalam bentuk suara. jika anda menslide ke kiri layar, terdapat menu tombol informasi cuaca diwilayah lain, tombol informasi gempa terkini, tombol informasi kualitas udara. Semoga aplikasi ini dapat membantu anda dalam mendapatkan informasi prakiraan cuaca, gempa bumi, dan kualitas udara. tekan tombol skip dibawah untuk masuk ke menu utama.";

    flutterTts.speak(teksTutorial5);
  }

  Future _stop() async {
    await flutterTts.stop();
  }

  Future _timer2F() async {
    var timer2 = Timer(const Duration(seconds: 16), () async {
      await _speakTutor2();
    });
  }

  Future _timer3F() async {
    var timer3 = Timer(const Duration(seconds: 38), () async {
      await _speakTutor3();
    });
  }

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
                child: Semantics(
                  label: 'halaman tutorial',
                  child: const ExcludeSemantics(
                    child: Text('Tutorial',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'fauna one',
                            fontSize: 40,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Semantics(
                  container: true,
                  label: 'tombol tutorial aplikasi info BMKG',
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    child: FittedBox(
                      child: AvatarGlow(
                          animate: true,
                          glowColor: Colors.black,
                          endRadius: 35.0,
                          duration: const Duration(milliseconds: 2000),
                          repeatPauseDuration:
                              const Duration(milliseconds: 100),
                          child: ExcludeSemantics(
                            child: FloatingActionButton(
                                heroTag: 'btn1',
                                backgroundColor: Color(0xfffffc00),
                                onPressed: () async {
                                  if (await Vibration.hasVibrator() ?? false) {
                                    Vibration.vibrate(duration: 100);
                                  }
                                  speech.stop();

                                  await _speakTutor1();
                                },
                                child: const Icon(
                                  Icons.play_arrow_sharp,
                                  color: Colors.black,
                                )),
                          )),
                    ),
                  ),
                ),
                Semantics(
                    container: true,
                    label: 'tombol skip tutorial',
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: FittedBox(
                        child: AvatarGlow(
                          animate: true,
                          glowColor: Colors.black,
                          endRadius: 35.0,
                          duration: const Duration(milliseconds: 2000),
                          repeatPauseDuration:
                              const Duration(milliseconds: 100),
                          child: ExcludeSemantics(
                            child: FloatingActionButton(
                              heroTag: 'btn2',
                              backgroundColor: Color(0xfffffc00),
                              onPressed: () async {
                                if (await Vibration.hasVibrator() ?? false) {
                                  Vibration.vibrate(duration: 100);
                                }

                                _stop();
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage(
                                    dataGempa: widget.dataGempa,
                                    dataUdara: widget.dataUdara,
                                    dataCuaca: widget.dataCuaca,
                                    dataKota: widget.dataKota,
                                    dataKotaHome: widget.dataKotaHome,
                                    dataGPS: widget.position,
                                    intGPS: widget.intGPS,
                                    indexTime: widget.indexTime,
                                  );
                                }));
                              },
                              child: const Text('SKIP',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'fira sans',
                                      fontSize: 20,
                                      color: Colors.black)),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
