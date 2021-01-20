import 'package:flutter/material.dart';

class ExperimentCustomLoadingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ExperimentCustomLoadingHome(),
    );
  }
}

class ExperimentCustomLoadingHome extends StatefulWidget {
  @override
  _ExperimentCustomLoadingHomeState createState() =>
      _ExperimentCustomLoadingHomeState();
}

class _ExperimentCustomLoadingHomeState
    extends State<ExperimentCustomLoadingHome> {
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
                LoadingOverlay.show(context);
                await Future.delayed(Duration(seconds: 2));
                LoadingOverlay.dismiss(context);
              },
              child: Text('Show'),
            ),
            RaisedButton(
              onPressed: () async {
                LoadingOverlay.dismiss(context);
              },
              child: Text('Dismiss'),
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ExperimentCustomLoadingHome()));
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  static void show(BuildContext context) =>
      Navigator.of(context).push(PageRouteBuilder(
        pageBuilder: (context, animation, animation2) {
          return LoadingOverlay();
        },
        fullscreenDialog: true,
        barrierColor: Colors.black45,
        opaque: false,
        barrierDismissible: false,
        maintainState: false,
      ));

  static void dismiss(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(24),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
