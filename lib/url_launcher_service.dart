import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:io'; // for sharing through whatsapp

class UrlLauncherExample extends StatefulWidget {
  @override
  _UrlLauncherExampleState createState() => _UrlLauncherExampleState();
}

class _UrlLauncherExampleState extends State<UrlLauncherExample> {
  _customLaunch(data) async {
    if (await canLaunch(data)) {
      await launch(data);
    } else {
      throw ("Sorry, could not launch $data");
    }
  }

  void launchWhatsApp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
      } else {
        return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
      }
    }

    _customLaunch(url());
  }

  void launchMap({@required String lat, @required String lng}) async {
    String url() {
      if (Platform.isIOS) {
        return "https://maps.apple.com/?q=$lat,$lng";
      } else {
        return "comgooglemaps://?center=$lat,$lng";
      }
    }

    _customLaunch(url());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Url Launcher"),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                minWidth: 300,
                height: 50,
                child: RaisedButton.icon(
                  onPressed: () {
                    _customLaunch("https://www.google.com/");
                  },
                  label: Text("Open a Website", style: TextStyle(fontSize: 18)),
                  icon: Icon(Icons.web),
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 300,
                height: 50,
                child: RaisedButton.icon(
                  color: Colors.white,
                  onPressed: () => setState(() {
                    _customLaunch('tel:8402053663');
                  }),
                  icon: Icon(Icons.call),
                  label: Text("Call", style: TextStyle(fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 300,
                height: 50,
                child: RaisedButton.icon(
                  onPressed: () {
                    _customLaunch('sms:+8402053663');
                  },
                  icon: Icon(Icons.sms),
                  label: Text("Send an SMS", style: TextStyle(fontSize: 18)),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 300,
                height: 50,
                child: RaisedButton.icon(
                  onPressed: () {
                    _customLaunch("mailto:maitriraval20@gmail.com");
                  },
                  label: Text("Send an Email", style: TextStyle(fontSize: 18)),
                  icon: Icon(Icons.email),
                  color: Colors.white,
                  textColor: Colors.black,
                  // splashColor: Colors.grey,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 300,
                height: 50,
                child: RaisedButton.icon(
                  onPressed: () {
                    launchWhatsApp(phone: '919724596079', message: "hello");
                  },
                  label: Text("Whats app", style: TextStyle(fontSize: 18)),
                  icon: Icon(Icons.share),
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 300,
                height: 50,
                child: RaisedButton.icon(
                  onPressed: () {
                    launchMap(lat: "23.033863", lng: "72.585022");
                  },
                  label: Text("Launch Map", style: TextStyle(fontSize: 18)),
                  icon: Icon(Icons.map),
                  color: Colors.white,
                  textColor: Colors.black,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
