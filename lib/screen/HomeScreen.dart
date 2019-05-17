import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:qr_utils/qr_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String _content = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xFFF6F8FA),
      appBar: AppBar(
        elevation: 0.1, // Check Platform if android
        backgroundColor: const Color(0xFFF6F8FA),
        title: new Center(
          child: new Text(
            'QR SCAN',
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFF6F8FA),
        margin: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                //width: 260.0,
                height: 220.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(16.0),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/ic_scan.png',
                    width: 110.0,
                    height: 110.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 4.0),
                width: double.infinity,
                //height: 80.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    _content != null ? _content : '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => _openQRScanner(),
              child: new Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30.0),
                  width: 180.0,
                  height: 48.0,
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.red,
                    borderRadius: new BorderRadius.all(
                      new Radius.circular(24.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'SCAN',
                      style: TextStyle(
                        color: Colors.white,
//                    /fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _openQRScanner() async {
    String _content;
    try {
      _content = await QrUtils.scanQR;
    } on PlatformException catch (e) {
      _content=null;
      showSnackBar('Process Failed!');
    } catch (e) {
      _content=null;
      showSnackBar('Process Failed!');
    }
    setState(() {
      this._content = _content;
    });
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );

    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
