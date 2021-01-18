import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class FlutterProgressHudApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProgressHUD(
        child: FlutterProgressHudScreen(),
      ),
      builder: (context, child) {
        return ProgressHUD(child: child);
      },
    );
  }
}

class FlutterProgressHudScreen extends StatefulWidget {
  @override
  _FlutterProgressHudScreenState createState() =>
      _FlutterProgressHudScreenState();
}

class _FlutterProgressHudScreenState extends State<FlutterProgressHudScreen> {
  // To dimiss on dispose
  var progressHud;

  @override
  void dispose() {
    progressHud.dismiss();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    progressHud = ProgressHUD.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress HUD')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Show'),
              onPressed: () async {
                ProgressHUD.of(context).show();
                await Future.delayed(Duration(seconds: 3));
                if (mounted) ProgressHUD.of(context).dismiss();
              },
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FlutterProgressHudScreen()));
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
