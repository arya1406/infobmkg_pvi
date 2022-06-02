import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:async'; // Contains HTML parsers to generate a Document object
//import 'package:html/dom.dart' as dom;
import 'tutorialPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      _sendDataGrabbing(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffc00),
      body: Stack(
        children: [
          Center(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'InfoBMKG-PVI',
                    style: TextStyle(
                        fontFamily: 'fauna one',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: Colors.black),
                  ),
                  Text(
                    'InfoBMKG for People with\nVision Impairments\n\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'fauna one',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  Image(
                    image: AssetImage('images/BMKG.png'),
                    width: 153,
                    height: 106,
                  ),
                ],
              ),
            ),
          ),
          Center(
              child: Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.all(10),
            child: Text(
              'by Aruya',
              style: TextStyle(
                  fontFamily: 'Museo Moderno',
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ))
        ],
      ),
    );
  }
}

void _sendDataGrabbing(BuildContext context) async {
  //? Grabbing Data Cuaca
  Xml2Json xml2json = new Xml2Json();
  List dataKota = [];
  List dataKotaHome = [];
  List<List<List<String>>> listDataUdara =
      List.generate(33, (i) => List.generate(8, (index) => []));
  List waktuCuaca = [
    '',
    'Pagi hari',
    'Siang hari',
    'Malam hari',
    '',
    'Besok Pagi',
    'Besok Siang',
    'Besok Malam'
  ];

  try {
    var client = Client();
    Response response = await client.get(Uri.parse(
        'https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-Indonesia.xml'));
    xml2json.parse(response.body);
    var jsondata = xml2json.toGData();
    var data = json.decode(jsondata);
    var parameter;

    for (var i = 0; i < data['data']['forecast']['area'].length; i++) {
      dataKota.add(data['data']['forecast']['area'][i]['name'][0][r'$t']);
      dataKotaHome.add(data['data']['forecast']['area'][i]['name'][1][r'$t']);
      for (var j = 0; j < 8; j++) {
        if (j == 0) {
          continue;
        }
        if (j == 4) {
          continue;
        }

        listDataUdara[i][j].add(waktuCuaca[j]);
        parameter = data['data']['forecast']['area'][i]['parameter'][6]
            ['timerange'][j]['value'][r'$t'];
        if (parameter == '0') {
          parameter = 'Cerah';
        }
        if (parameter == '1') {
          parameter = 'Cerah Berawan';
        }
        if (parameter == '2') {
          parameter = 'Cerah Berawan';
        }
        if (parameter == '3') {
          parameter = 'Berawan';
        }
        if (parameter == '4') {
          parameter = 'Berawan Tebal';
        }
        if (parameter == '5') {
          parameter = 'Udara Kabur';
        }
        if (parameter == '10') {
          parameter = 'Asap';
        }
        if (parameter == '45') {
          parameter = 'Kabut ';
        }
        if (parameter == '60') {
          parameter = 'Hujan Ringan';
        }
        if (parameter == '61') {
          parameter = 'Hujan Sedang';
        }
        if (parameter == '63') {
          parameter = 'Hujan Lebat';
        }
        if (parameter == '80') {
          parameter = 'Hujan Lokal';
        }
        if (parameter == '95') {
          parameter = 'Hujan Petir';
        }
        if (parameter == '97') {
          parameter = 'Hujan Petir';
        }
        listDataUdara[i][j].add(parameter);
        listDataUdara[i][j].add(data['data']['forecast']['area'][i]['parameter']
            [5]['timerange'][j]['value'][0][r'$t']);
        listDataUdara[i][j].add(data['data']['forecast']['area'][i]['parameter']
            [0]['timerange'][j]['value'][r'$t']);
        parameter = data['data']['forecast']['area'][i]['parameter'][8]
            ['timerange'][j]['value'][2][r'$t'];
        if (parameter == '0') {
          parameter = '0.00';
        }
        listDataUdara[i][j].add(parameter);
        parameter = data['data']['forecast']['area'][i]['parameter'][7]
            ['timerange'][j]['value'][1][r'$t'];
        if (parameter == 'N') {
          parameter = 'Utara';
        }
        if (parameter == 'NNE') {
          parameter = 'Utara - timur laut';
        }
        if (parameter == 'NE') {
          parameter = 'Timur laut';
        }
        if (parameter == 'ENE') {
          parameter = 'Timur-Timur Laut';
        }
        if (parameter == 'E') {
          parameter = 'Timur';
        }

        if (parameter == 'ESE') {
          parameter = 'Timur-Tenggara';
        }
        if (parameter == 'SE') {
          parameter = 'Tenggara';
        }
        if (parameter == 'SSE') {
          parameter = 'Selatan-Tenggara';
        }
        if (parameter == 'S') {
          parameter = 'Selatan';
        }
        if (parameter == 'SSW') {
          parameter = 'Selatan-Barat Daya';
        }
        if (parameter == 'SW') {
          parameter = 'Barat daya';
        }
        if (parameter == 'WSW') {
          parameter = 'Barat-Barat Daya';
        }
        if (parameter == 'W') {
          parameter = 'Barat';
        }
        if (parameter == 'WNW') {
          parameter = 'Barat-Barat Laut';
        }
        if (parameter == 'NW') {
          parameter = 'Barat laut';
        }
        if (parameter == 'NNW') {
          parameter = 'Utara-Barat Laut';
        }
        if (parameter == 'VARIABLE') {
          parameter = ' arah yang berubah-ubah';
        }

        listDataUdara[i][j].add(parameter);
      }
    }
    //print(listDataUdara[0][0][0]);
    for (var i = 0; i < data['data']['forecast']['area'].length; i++) {
      listDataUdara[i].removeAt(0);
      listDataUdara[i].removeAt(3);
    }
  } catch (e) {
    print(e);
  }

  //?GPS
  String dataGPS;
  int intGPS;
  int indexGPS = 1;
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  Position? position = await Geolocator.getLastKnownPosition();
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position!.latitude, position.longitude);
  dataGPS = placemarks[0].subAdministrativeArea!;
  for (var item in dataKotaHome) {
    print(item);
    if (dataGPS == item) {
      print(item);
      indexGPS = dataKotaHome.indexOf(item);
      print(indexGPS);
      break;
    } else {
      indexGPS = 1;
    }
  }

  //? Grabbing Data gempa
  var dataGempa = [];
  var jarakGempa;
  List<List<String>> listDataGempa = [[], [], [], [], []];
  try {
    var client = Client();
    Response response = await client.get(
        Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.xml'));
    xml2json.parse(response.body);
    var jsondata = xml2json.toGData();
    var data = json.decode(jsondata);
    var koordinat;

    for (var i = 0; i < 5; i++) {
      listDataGempa[i].add(data['Infogempa']['gempa'][i]['Magnitude'][r'$t']);
      listDataGempa[i].add(data['Infogempa']['gempa'][i]['Tanggal'][r'$t']);
      listDataGempa[i].add(data['Infogempa']['gempa'][i]['Jam'][r'$t']);
      listDataGempa[i].add(data['Infogempa']['gempa'][i]['Wilayah'][r'$t']);
      koordinat = data['Infogempa']['gempa'][i]['point']['coordinates'][r'$t'];
      var indexKoma = koordinat.indexOf(',');
      var latGempa = double.parse(koordinat.substring(0, indexKoma));
      var longGempa = double.parse(koordinat.substring(indexKoma + 1));
      double distanceInMeters = Geolocator.distanceBetween(
          position.latitude, position.longitude, latGempa, longGempa);
      jarakGempa = (distanceInMeters / 1000).round();
      listDataGempa[i].add(jarakGempa.toString());
      listDataGempa[i].add(data['Infogempa']['gempa'][i]['Potensi'][r'$t']);
      //dataGempa[i].add(listDataGempa);
    }

    dataGempa = listDataGempa;

    //dataGempa.add(data['Infogempa']['gempa'][0]['Tanggal'][r'$t']);
  } catch (e) {
    print(e);
  }
  //? Make API call to web
  var client = Client();
  Response response = await client.get(Uri.parse(
      'https://www.bmkg.go.id/kualitas-udara/informasi-partikulat-pm10.bmkg'));

  //?Use Html Parser and query selector
  var document = parse(response.body);
  List links = document.querySelectorAll('div.pm10');
  List looks = [];
  List statusAll = [];
  List<Map<String, dynamic>> linkMap = [];
  List<Map<String, dynamic>> wilMap = [];
  List<Map<String, dynamic>> statMap = [];

  var parseData;
  var statusData;
  for (var link in links) {
    linkMap.add({'script': link.text});
  }
  for (int i = 0; i < linkMap.length; i++) {
    var data = linkMap[i]['script'];
    var kotaIndex = data.indexOf("('#container");
    var petikIndex = data.indexOf("').highcharts");
    var kotaSub = data.substring(kotaIndex + 12, petikIndex);
    looks.add(kotaSub);
    //print(looks);
    for (var j = 0; j < 24; j++) {
      var dataIndex = data.indexOf("['$j',");
      if (dataIndex == -1) {
        if (parseData <= 50.0) {
          statusData = 'Baik';

          //print(statusData);
        }
        if (parseData > 50.0 && parseData <= 150) {
          statusData = 'Sedang';
          //print(statusData);
        }
        statusAll.add(statusData);
        break;
      }
      if (j >= 10) {
        var dataSub = data.substring(dataIndex + 7, dataIndex + 10);
        parseData = double.parse(dataSub);
        assert(parseData is double);
        //print(parseData);
      } else {
        var dataSub = data.substring(dataIndex + 6, dataIndex + 9);
        parseData = double.parse(dataSub);
        assert(parseData is double);
      }
    }
  }
  for (var look in looks) {
    wilMap.add({'wilayah': look});
  }
  for (var statusAlls in statusAll) {
    statMap.add({'status': statusAlls});
  }

  wilMap.addAll(statMap);
  List dataUdara = [];
  for (var i = 0; i < wilMap.length; i++) {
    dataUdara.add(wilMap[i].values.toList());
  }

  //? Time
  var now = DateTime.now();
  var indexTime;
  if (now.hour <= 6) {
    indexTime = 0;
  }
  if (now.hour >= 7 && now.hour <= 18) {
    indexTime = 1;
  }
  if (now.hour >= 19 && now.hour <= 24) {
    indexTime = 2;
  }
  intGPS = indexGPS;
  List dataToSend = dataGempa;
  List dataCuaca = listDataUdara;
  /*Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => PageGPS(
          position: dataGPS,
          intGPS: intGPS,
          dataKota: dataKota,
          indexTime: indexTime,
        ),
      )); */

  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => TutorialPage(
          dataGempa: dataToSend,
          dataUdara: dataUdara,
          dataCuaca: dataCuaca,
          dataKota: dataKota,
          dataKotaHome: dataKotaHome,
          position: dataGPS,
          intGPS: intGPS,
          indexTime: indexTime,
        ),
      ));
}
