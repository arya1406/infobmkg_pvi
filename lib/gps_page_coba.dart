import 'dart:async';

import 'package:flutter/material.dart';

class PageGPS extends StatefulWidget {
  final String position;
  final int intGPS;
  final List dataKota;
  final dynamic indexTime;
  const PageGPS(
      {Key? key,
      required this.position,
      required this.dataKota,
      required this.intGPS,
      this.indexTime})
      : super(key: key);
  @override
  _PageGPSState createState() => _PageGPSState();
}

class _PageGPSState extends State<PageGPS> {
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
              child: const Text('Pengaturan',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Museo Moderno',
                      fontSize: 45,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
        body: Center(
          child: Text(widget.indexTime.toString()),
        ),
      ),
    );
  }
}
