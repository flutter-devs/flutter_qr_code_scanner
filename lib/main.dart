import 'package:flutter/material.dart';
import 'package:flutter_qr_code_scanner/constant/Constant.dart';
import 'package:flutter_qr_code_scanner/screen/HomeScreen.dart';
import 'package:flutter_qr_code_scanner/screen/SplashScreen.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: 'QR Scanner',
        routes: <String, WidgetBuilder>{
          HOME_SCREEN: (BuildContext context) => HomeScreen(),
        },
        home: SplashScreen(),
      ),
    );
