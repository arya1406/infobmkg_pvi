import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infobmkg_pvi/splash_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'InfoBMKG',
    home: SplashScreen(),
  ));
}
