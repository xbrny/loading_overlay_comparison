import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoaderOverlayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      overlayOpacity: 0.9,
      overlayColor: Colors.black54,
      useDefaultLoading: true,
      child: MaterialApp(
        home: LoaderOverlayHome(),
      ),
    );
  }
}

class LoaderOverlayHome extends StatefulWidget {
  @override
  _LoaderOverlayHomeState createState() => _LoaderOverlayHomeState();
}

class _LoaderOverlayHomeState extends State<LoaderOverlayHome> {
  @override
  void dispose() {
    context.hideLoaderOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoaderOverlay')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                context.showLoaderOverlay();
                await Future.delayed(Duration(seconds: 3));
                if (mounted) context.hideLoaderOverlay();
              },
              child: Text('Show'),
            ),
            RaisedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoaderOverlayHome()));
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
