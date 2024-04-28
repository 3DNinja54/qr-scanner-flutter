import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData;
import 'package:url_launcher/url_launcher.dart' show launchUrl;

class QRPage extends StatelessWidget {
  final String link;
  const QRPage({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QR Scanner'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10.0, right: 10.0),
                    child: Text(
                      link,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18.0),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse(link));
                      },
                      child: const Text('Navigate to'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Go back')),
                    ElevatedButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: link));
                        },
                        child: const Text('Copy'))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
