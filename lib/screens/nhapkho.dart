import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../api_service.dart';
import '../imel.dart';

class BarcodeScannerScreen extends StatefulWidget {
  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  String _scanResult = 'Chưa quét mã nào';
  final ApiService _apiService = ApiService();

  Future<void> _scanBarcode() async {
    try {
      final scanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', // Màu của nút "Hủy" (Cancel)
        'Hủy', // Nội dung nút "Hủy"
        true, // Quét ở chế độ đa chiều (multi-line mode)
        ScanMode.BARCODE, // Chế độ quét mã vạch
      );

      if (!mounted) return;

      setState(() {
        _scanResult = scanResult != '-1' ? scanResult : 'Quét mã bị hủy';
      });

      if (scanResult != '-1') {
        final imel = Imel(imel: scanResult);
        await _apiService.postImel(imel);
      }
    } catch (e) {
      setState(() {
        _scanResult = 'Lỗi khi quét mã: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quét mã vạch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Kết quả quét:',
            ),
            Text(
              '$_scanResult',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _scanBarcode,
              child: Text('Quét mã vạch'),
            ),
          ],
        ),
      ),
    );
  }
}
