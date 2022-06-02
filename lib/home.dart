import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:infobmkg_pvi/button_bahasa.dart';
import 'package:infobmkg_pvi/button_cuaca.dart';
import 'package:infobmkg_pvi/button_gempa.dart';
import 'package:vibration/vibration.dart';

import 'button_udara.dart';

bool isPressed = false;
double heightButton = 300;
double widthButton = 165;

class HomePage extends StatefulWidget {
  final List dataGempa;
  final List dataUdara;
  final List dataCuaca;
  final List dataKota;
  final List dataKotaHome;
  final int intGPS;
  final String dataGPS;
  final dynamic indexTime;
  const HomePage(
      {Key? key,
      required this.dataGempa,
      required this.dataUdara,
      required this.dataCuaca,
      required this.dataKota,
      required this.dataKotaHome,
      required this.dataGPS,
      required this.intGPS,
      this.indexTime})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

enum TtsState { stopped, playing }

class _HomePageState extends State<HomePage> {
  bool _isListening = false;
  stt.SpeechToText speech = stt.SpeechToText();
  //stt.SpeechToText _speech;
  String _text = "Klik Tombol Mikrofon";
  String bahasa = 'id-ID';
  String empty = 'mendengarkan...';
  late Map varMap;
  var isSuhu = 'suhu';
  var isMendung = 'mendung';
  var isHujan = 'hujan';
  var isGerimis = 'gerimis';
  var isAwan = 'awan';
  var isPanas = 'panas';
  var isDingin = 'dingin';
  var isGelap = 'gelap';
  var isTerang = 'terang';
  var isSejuk = 'sejuk';
  var isCuacanya = 'cuacanya';
  var isCuaca = 'cuaca'; // cuaca
  var isGetarannya = 'getaranya';
  var isGetaran = 'getaran';
  var isGempanya = 'gempanya';
  var isGempa = 'gempa'; // gempa
  var isPolusi = 'polusi';
  var isKotor = 'kotor';
  var isGas = 'gas';
  var isUdaranya = 'udaranya'; // udara
  var isUdara = 'udara';
  var isHari = 'hari ini';
  var isBesok = 'besok';
  var isPagi = 'pagi';
  var isSiang = 'siang';
  var isMalam = 'malam';
  var isSore = 'sore';
  var isSekarang = 'sekarang';
  var newText = ''; //?
  var cuacaText = '';
  var gempaText = '';
  var udaraText = '';
  var nlp;
  var isJambi = 'jambi';
  var isMedan = 'medan';
  var isPangkalan = 'pangkalanbun';
  var isKototabang = 'kototabang';
  var isKemayoran = 'kemayoran';
  var isCibeureum = 'cibeureum';

//? Data cuaca dari DBase
  var isWilayah = '';
  var gpsWilayah = '';
  var waktu = '';
  var weather = '';
  var suhu = '';
  var kelembaban = '';
  var wSpeed = '';
  var wDir = '';

//? Data gempa dari DBase
  var titikGempa = '';
  var titikPengguna = '';
  var magnitude = '';
  var tanggal = '';
  var jam = '';
  var wilGempa = '';
  var jarak = ''; //? perhitungan dari titik_gempa dengan titik_pengguna
  var potensi = '';

  //? Data kualitas udara di Dbase
  var wilUdara;
  var kondisiUdara = '';
  var indexUdara;
  var udaraAll;
  var itemKota;

  dynamic languages;
  late String language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  late String newVoiceText;
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  final FlutterTts flutterTts = FlutterTts();

  Future _speak() async {
    _isListening = false;
    speech.stop();
    newText = _text.toLowerCase();

    var udara = newText.contains(isUdara) ||
        newText.contains(isUdaranya) ||
        newText.contains(isPolusi) ||
        newText.contains(isGas);

    for (var i = 0; i < widget.dataUdara.length / 2; i++) {
      itemKota = widget.dataUdara[i][0].toString().toLowerCase();
      if (itemKota == 'pangkalanbun') {
        itemKota = 'pangkalan bun';
      }
      if (itemKota == 'kototabang') {
        itemKota = 'koto tabang';
      }
      print(itemKota);
      print(newText);
      if (newText.contains(itemKota)) {
        print(true);
        udaraAll = ("Kualitas Udara di wilayah " + itemKota + " baik");
        break;
      }
      if (widget.dataGPS.toString().toLowerCase() == itemKota) {
        print(itemKota);
        indexUdara = widget.dataUdara.indexOf(itemKota);
        print(indexUdara);
        udaraAll = ("Kualitas Udara di wilayah " + widget.dataGPS + " baik");
      }
      if (!newText.contains(itemKota)) {
        udaraAll = ("maaf, data diwilayah tersebut tidak ada");
      }
    }

    var polusi = newText.contains(isPolusi);
    var cuaca = newText.contains(isCuaca) ||
        newText.contains(isHujan) ||
        newText.contains(isCuacanya) ||
        newText.contains(isGelap) ||
        newText.contains(isGerimis) ||
        newText.contains(isMendung) ||
        newText.contains(isTerang) ||
        newText.contains(isDingin) ||
        newText.contains(isPanas) ||
        newText.contains(isSejuk) ||
        newText.contains(isAwan) ||
        newText.contains(isSuhu);
    var gempa = newText.contains(isGempa) ||
        newText.contains(isGetaran) ||
        newText.contains(isGetarannya);

    var wilayah1 = newText.contains(isMedan);
    var wilayah2 = newText.contains(isKototabang);
    var wilayah3 = newText.contains(isJambi);
    var wilayah4 = newText.contains(isCibeureum);
    var wilayah5 = newText.contains(isPangkalan);
    var sekarang = newText.contains(isSekarang);
    var besok = newText.contains(isBesok);
    var pagi = newText.contains(isPagi);
    var siang = newText.contains(isSiang);
    var malam = newText.contains(isMalam);
    var besokPagi = newText.contains(isBesok) && newText.contains(isPagi);
    var besokSiang = newText.contains(isBesok) && newText.contains(isSiang);
    var besokMalam = newText.contains(isBesok) && newText.contains(isMalam);
    var hariIni = newText.contains(isHari);

    var teksCuaca = '\n cuaca ' +
        widget.dataCuaca[widget.intGPS][widget.indexTime][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][widget.indexTime][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][widget.indexTime][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][widget.indexTime][4]
            .toString()
            .substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][widget.indexTime][5].toString();

    var teksCuacaBesok = 'Besok Hari , \n cuaca ' +
        widget.dataCuaca[widget.intGPS][3][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][3][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][3][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][3][4].toString().substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][0][5].toString();

    var teksCuacaPagi = 'Pagi Hari , \n cuaca ' +
        widget.dataCuaca[widget.intGPS][0][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][0][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][0][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][0][4].toString().substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][0][5].toString();

    var teksCuacaSiang = 'Siang Hari , \n cuaca ' +
        widget.dataCuaca[widget.intGPS][1][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][1][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][1][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][1][4].toString().substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][1][5].toString();

    var teksCuacaMalam = 'Malam Hari , \n cuaca ' +
        widget.dataCuaca[widget.intGPS][2][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][2][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][2][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][2][4].toString().substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][2][5].toString();

    var teksCuacaBesokPagi = 'Besok Pagi , \n cuaca ' +
        widget.dataCuaca[widget.intGPS][3][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][3][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][3][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][3][4].toString().substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][3][5].toString();

    var teksCuacaBesokSiang = 'Besok Siang, \n cuaca ' +
        widget.dataCuaca[widget.intGPS][4][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][4][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][4][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][4][4].toString().substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][4][5].toString();

    var teksCuacaBesokMalam = 'Besok Malam , \n cuaca ' +
        widget.dataCuaca[widget.intGPS][5][1].toString() +
        ' dengan suhu ' +
        widget.dataCuaca[widget.intGPS][5][2].toString() +
        'derajat, kelembaban ' +
        widget.dataCuaca[widget.intGPS][5][3].toString() +
        '%, kecepatan angin ' +
        widget.dataCuaca[widget.intGPS][5][4].toString().substring(0, 2) +
        ' kilometer perjam ke ' +
        widget.dataCuaca[widget.intGPS][5][5].toString();

    gempaText = ('gempa berkekuatan ' +
        widget.dataGempa[0][0].toString() +
        ' Magnitudo, pada ' +
        widget.dataGempa[0][1].toString() +
        ' jam ' +
        widget.dataGempa[0][2].toString().substring(0, 5) +
        widget.dataGempa[0][2].toString().substring(9) +
        ',di  ' +
        widget.dataGempa[0][3].toString().substring(0, 6) +
        ' ' +
        widget.dataGempa[0][3].toString().substring(6) +
        ' ,' +
        widget.dataGempa[0][4].toString() +
        ' kilometer dari anda, ' +
        widget.dataGempa[0][5].toString().substring(0, 6) +
        widget.dataGempa[0][5].toString().substring(6) +
        ',');

    flutterTts.setLanguage(bahasa);
    await flutterTts.setPitch(pitch);

    if (cuaca) {
      await flutterTts.speak(teksCuaca);
    }
    if (cuaca && pagi) {
      await flutterTts.speak(teksCuacaPagi);
    }
    if (cuaca && siang) {
      await flutterTts.speak(teksCuacaSiang);
    }
    if (cuaca && malam) {
      await flutterTts.speak(teksCuacaMalam);
    }
    if (cuaca && besok) {
      await flutterTts.speak(teksCuacaBesok);
    }
    if (cuaca && besokPagi) {
      await flutterTts.speak(teksCuacaBesokPagi);
    }
    if (cuaca && besokSiang) {
      await flutterTts.speak(teksCuacaBesokSiang);
    }
    if (cuaca && besokMalam) {
      await flutterTts.speak(teksCuacaBesokMalam);
    }

    if (gempa) {
      await flutterTts.speak(gempaText);
    }

    if (udara || polusi) {
      await flutterTts.speak(udaraAll);
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    TabBar myTabbar = TabBar(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        //border: Border(bottom: BorderSide(color: Colors.black, width: 3)),
        color: const Color(0xffbebc23),
      ),
      tabs: [
        Tab(
            child: Semantics(
          container: true,
          label: 'menu mikrofon',
          child: Container(
            width: 100,
            child: const ExcludeSemantics(
              child: Image(
                height: 73,
                image: AssetImage('images/mic.png'),
              ),
            ),
          ),
        )),
        Tab(
          child: Semantics(
            container: true,
            label: 'menu informasi lainnya',
            child: Container(
                width: 100,
                child: const ExcludeSemantics(
                  child: Image(
                    image: AssetImage('images/weather.png'),
                  ),
                )
                /*Text(
                'INFORMASI',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'fira sans', fontSize: 25),
              ),*/
                ),
          ),
        ),
      ],
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xfffffc00),
              title: const Center(
                child: Text(
                  'infoBMKG',
                  style: TextStyle(
                      fontFamily: 'fauna one',
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              bottom: PreferredSize(
                  child: Container(
                    color: const Color(0xfffffc00),
                    child: myTabbar,
                  ),
                  preferredSize:
                      Size.fromHeight(myTabbar.preferredSize.height)),
            ),
            body: TabBarView(children: [
              Container(
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Semantics(
                      container: true,
                      label: _text,
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(13),
                        height: MediaQuery.of(context).size.height / 3,
                        child: ExcludeSemantics(
                          child: Text(
                            //maxLines: 21,
                            (_text == '') ? empty : _text,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'fira sans',
                                fontSize: 35,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Semantics(
                      container: true,
                      label: 'tombol mikrofon',
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        child: FittedBox(
                            child: AvatarGlow(
                          animate: true,
                          glowColor: Colors.black,
                          endRadius: 35.0,
                          duration: const Duration(milliseconds: 2000),
                          repeatPauseDuration:
                              const Duration(milliseconds: 100),
                          repeat: _isListening,
                          child: ExcludeSemantics(
                            child: FloatingActionButton(
                              backgroundColor: const Color(0xfffffc00),
                              onPressed: () async {
                                if (await Vibration.hasVibrator() == true) {
                                  Vibration.vibrate(duration: 100);
                                }
                                _listen();
                              },
                              child: const Image(
                                  image: AssetImage(
                                "images/mic.png",
                              )),
                            ),
                          ),
                        )),
                      ),
                    ),
                  ],
                )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonUdara(dataUdara: widget.dataUdara),
                  ButtonGempa(
                    dataGempa: widget.dataGempa,
                  ),
                  ButtonCuaca(
                    dataCuaca: widget.dataCuaca,
                    dataKota: widget.dataKota,
                  )
                ],
              ),
            ]),
          ),
        ));
  }

  void _listen() async {
    if (!_isListening) {
      bool? available = await speech.initialize(
          onStatus: (val) => print('onStatus: $val'),
          onError: (val) => print('onError: $val'));
      if (available) {
        setState(() {
          _isListening = true;
          if (_isListening) {
            _stop();
          }
        });
        speech.listen(
            localeId: bahasa,
            listenMode: ListenMode.confirmation,
            onResult: (val) {
              setState(() {
                _text = val.recognizedWords;
              });
              if (val.finalResult) {
                _speak();
              }
            });
      }
    } else {
      setState(() {
        _isListening = false;
      });
      speech.stop();
    }
  }
}
