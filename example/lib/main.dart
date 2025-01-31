import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:better_screenshot_prevention/better_screenshot_prevention.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await BetterScreenshotPrevention.preventScreenshot;
                      print("try to screenshot now, i bet you cant 😎");
                    } catch (e) {
                      print("dont know whats wrong 😅");
                    }
                  },
                  child: Text("disallow SS")),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      await BetterScreenshotPrevention.allowScreenshot;
                      print("you might screenshot again 😎");
                    } catch (e) {
                      print("dont know whats wrong 😅");
                    }
                  },
                  child: Text("allow SS")),
            ],
          ),
        ),
      ),
    );
  }
}
