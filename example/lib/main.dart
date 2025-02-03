import 'dart:developer';
import 'package:flutter/material.dart';
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
              Text('Screenshot This'),
              ElevatedButton(
                  onPressed: () async {
                    await BetterScreenshotPrevention.preventScreenshot;
                    log("try to screenshot now, i bet you cant 😎");
                  },
                  child: const Text("disallow SS")),
              ElevatedButton(
                  onPressed: () async {
                    await BetterScreenshotPrevention.allowScreenshot;
                    log("you might screenshot again 😎");
                  },
                  child: const Text("allow SS")),
            ],
          ),
        ),
      ),
    );
  }
}
