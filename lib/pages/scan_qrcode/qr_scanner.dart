import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:sampang/controllers/detail_kendaraan_controller.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final MobileScannerController controller = MobileScannerController(
    detectionSpeed: DetectionSpeed.noDuplicates,
    formats: [BarcodeFormat.qrCode],
  );

  bool _isProcessing = false;
  String? _lastCode;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_isProcessing) return;

    final barcode = capture.barcodes.first;
    final String? code = barcode.rawValue;

    if (code != null && code != _lastCode) {
      setState(() {
        _isProcessing = true;
        _lastCode = code;
      });

      controller.stop();

      final DetailKendaraanController detailKendaraanController =
          Get.put(DetailKendaraanController());

      try {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('🔍 Memeriksa data untuk QR: $code')),
        );

        // 🔥 Tampilkan loading overlay
        showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black54,
          builder: (_) => const Center(
            child: CircularProgressIndicator(color: Colors.greenAccent),
          ),
        );

        // 🔥 Panggil fungsi controller untuk ambil data
        detailKendaraanController.getData(code);

        // ✅ Tutup dialog loading
        if (context.mounted) Navigator.pop(context);

        // ✅ Navigasi ke halaman hasil
        Get.toNamed('/cekdatakendaraan');
        controller.start();
        setState(() {
          _isProcessing = false;
          _lastCode = null;
        });
      } catch (e) {
        if (context.mounted) Navigator.pop(context); // tutup dialog kalau error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Gagal mengambil data: $e')),
        );

        // Aktifkan ulang scanner
        controller.start();
        setState(() => _isProcessing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          /// Kamera scanner
          MobileScanner(
            controller: controller,
            onDetect: _onDetect,
          ),

          /// Overlay area scanner
          QRScannerOverlay(
            overlayColor: Colors.black.withOpacity(0.6),
            borderColor: Colors.greenAccent,
            borderRadius: 12,
            borderStrokeWidth: 8,
            scanAreaWidth: 250,
            scanAreaHeight: 250,
          ),

          /// Text dan tombol bawah
          Positioned(
            bottom: 80,
            child: Column(
              children: [
                const Text(
                  'Arahkan QR Code ke dalam kotak',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 16),
                IconButton(
                  icon:
                      const Icon(Icons.flash_on, color: Colors.white, size: 32),
                  onPressed: () => controller.toggleTorch(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
