import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FlutterEasyLoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.dark
      ..maskColor = Colors.blue.withOpacity(0.1)
      ..userInteractions = false
      ..dismissOnTap = false;

    return MaterialApp(
      home: FlutterEasyLoadingHome(),
      builder: EasyLoading.init(),
    );
  }
}

class FlutterEasyLoadingHome extends StatefulWidget {
  @override
  _FlutterEasyLoadingHomeState createState() => _FlutterEasyLoadingHomeState();
}

class _FlutterEasyLoadingHomeState extends State<FlutterEasyLoadingHome> {
  @override
  void dispose() {
    // if (EasyLoading.isShow) EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FlutterEasyLoading')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                EasyLoading.show();
                await Future.delayed(Duration(seconds: 5));
                EasyLoading.dismiss();
              },
              child: Text('Show'),
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FlutterEasyLoadingHome()));
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
