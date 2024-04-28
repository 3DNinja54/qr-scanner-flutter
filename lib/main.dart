import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'qr_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      title: 'QR Scanner',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR Scanner'),
          backgroundColor: Colors.blue,
        ),
        body: const Center(child: QrButton()),
      ),
    );
  }
}

class QrButton extends StatefulWidget {
  const QrButton({super.key});

  @override
  State<QrButton> createState() => _QrButtonState();
}

class _QrButtonState extends State<QrButton> {
  String qrCode = '';
  Future<void> scanQR() async {
    final qrCodeResult = await FlutterBarcodeScanner.scanBarcode(
        '#00ff00', 'Cancel', true, ScanMode.QR);

    setState(() {
      qrCode = qrCodeResult;
    });
    navigateToQRCode();
  }

  navigateToQRCode() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => QRPage(link: qrCode)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => scanQR(),
          child: const Text(
            'Scan QR',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
