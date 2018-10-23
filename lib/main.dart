import 'package:flutter/material.dart';
import 'package:flutter_qr_code_scaneer_app/constant/Constant.dart';
import 'package:flutter_qr_code_scaneer_app/screen/HomeScreen.dart';
import 'package:flutter_qr_code_scaneer_app/screen/SplashScreen.dart';

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
