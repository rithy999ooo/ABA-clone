import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String result = "Scan a QR code";

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData.code ?? "No data";
      });

      controller.pauseCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
          //Camera (backgourd)
          QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),

          //dark overlay
          Container(color: Colors.black.withValues(alpha: .5)),

          // top bar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Center title
                const Text(
                  "QR Scan",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //leading close bts
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),

          //payment info+  frame
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Accepted Payments",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 15),

                /// payment row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _paymentBox("ABA Pay"),
                    _paymentBox("Visa"),
                    _paymentBox("KHQR"),
                    _paymentBox("Cash"),
                    _paymentBox("Card"),
                  ],
                ),

                const SizedBox(height: 30),

                //scan frame over camera
                Container(
                  width: 280,
                  height: 280,
                  child: Stack(
                    children: [
                      /// corners
                      _corner(top: 0, left: 0, isTop: true, isLeft: true),
                      _corner(top: 0, right: 0, isTop: true, isLeft: false),
                      _corner(bottom: 0, left: 0, isTop: false, isLeft: true),
                      _corner(bottom: 0, right: 0, isTop: false, isLeft: false),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // result
                Text(
                  result,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),

          //bottom tool
          Positioned(
            top: 600,
            bottom: 70,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.flashlight_on, color: Colors.white),
                Icon(Icons.image, color: Colors.white),
              ],
            ),
          ),

          //manual button
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: const Center(
                child: Text(
                  "ENTER MERCHANT ID MANUALLY",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // payment badge
  Widget _paymentBox(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        name,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }

  //corner design
  Widget _corner({
    double? top,
    double? bottom,
    double? left,
    double? right,
    bool isTop = false,
    bool isLeft = false,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            top: isTop
                ? const BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
            bottom: !isTop
                ? const BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
            left: isLeft
                ? const BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
            right: !isLeft
                ? const BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }
}
