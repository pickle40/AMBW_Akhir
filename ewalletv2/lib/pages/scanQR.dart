// import 'package:flutter/material.dart';

// class scanQR extends StatelessWidget {
//   const scanQR({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             title: Text("OWO E-Wallet"),
//           ),
//           body: Center(
//             child: Text("Coming Soon"),
//           ),
//         ));
//   }
// }
import 'dart:io';

import 'package:ewalletv2/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class scanQR extends StatefulWidget {
  const scanQR({Key? key}) : super(key: key);

  @override
  State<scanQR> createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;
  Barcode? barcode;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scan QR"),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(
              bottom: 10,
              child: result(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQrViewCreated,
        overlay: QrScannerOverlayShape(
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderColor: Colors.red,
        ),
      );
  void onQrViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((barcode) {
      setState(() {
        this.barcode = barcode;
      });
    });
  }

  Widget result() => Text(
    barcode != null ? 'Hasil : ${barcode!.code}' : 'Scan me',
    maxLines: 3,
  );

  // Widget result() =>
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
}
