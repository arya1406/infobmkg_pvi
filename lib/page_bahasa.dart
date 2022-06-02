import 'package:infobmkg_pvi/RadBut_bahasa.dart';
import 'package:flutter/material.dart';

class PageBahasa extends StatefulWidget {
  @override
  _PageBahasaState createState() => _PageBahasaState();
}

class _PageBahasaState extends State<PageBahasa> {
  final isSelected = <bool>[false, false];
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
              child: Text('Pengaturan',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Museo Moderno',
                      fontSize: 45,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.only(top: 60),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Bahasa',
                  style: TextStyle(
                      fontFamily: 'Museo Moderno',
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                ),
                Container(margin: EdgeInsets.only(top: 30), child: RadButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
