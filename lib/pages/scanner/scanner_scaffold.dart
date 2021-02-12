import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScaffold extends StatefulWidget {
  const QRScannerScaffold();
  @override
  _QRScannerScaffoldState createState() => _QRScannerScaffoldState();
}

class _QRScannerScaffoldState extends State<QRScannerScaffold> {
  QRViewController _qrViewController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void dispose() {
    _qrViewController.dispose();
    super.dispose();
  }

  bool _toggleFlashLight = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _qrViewController.toggleFlash();
            _toggleFlashLight = !_toggleFlashLight;
          });
        },
        child: Icon(_toggleFlashLight ? Icons.flash_on : Icons.flash_off),
      ),
      body: QRView(
        key: _qrKey,
        onQRViewCreated: (controller) {
          _qrViewController = controller;
          _qrViewController.scannedDataStream.listen((event) {
            if (event != null) {
              _qrViewController.dispose();
            }

            Navigator.pop(context, event);
          });
        },
      ),
    );
  }
}
