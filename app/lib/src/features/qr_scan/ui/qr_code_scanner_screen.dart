import 'dart:io';

import 'package:eb_components/eb_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_leaf_kit/flutter_leaf_kit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({super.key});

  @override
  State<QRCodeScannerScreen> createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool _isFind = false;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scanArea = (screenWidth < 400 || screenWidth < 400) ? 150.0 : 300.0;

    return Scaffold(
      appBar: const LFAppBar(
        title: EBText('QR Code Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              // overlay: QrScannerOverlayShape(
              //   borderColor: Colors.red,
              //   borderRadius: 10,
              //   borderLength: 30,
              //   borderWidth: 10,
              //   cutOutSize: scanArea,
              // ),
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? EBText(
                      'Barcode Type: ${result!.format} Data: ${result!.code}')
                  : const EBText('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      // setState(() {
      //   result = scanData;
      // });
      final format = scanData.format;
      final code = scanData.code;
      if (format == BarcodeFormat.qrcode && code != null) {
        if (_isFind) return;
        _isFind = true;
        LFNavigation.pop(context, param: <String, String>{'QRCODE': code});
      }
    });
  }
}
