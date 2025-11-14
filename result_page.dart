import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String kategori;
  final Color warna;

  const ResultPage({
    super.key,
    required this.bmi,
    required this.kategori,
    required this.warna,
  });

  // FUNGSI UNTUK PESAN REKOMENDASI
  String _getPesanRekomendasi() {
    switch (kategori) {
      case 'KURUS':
        return '• Tingkatkan asupan makanan bergizi\n• Konsumsi protein dan karbohidrat sehat\n• Konsultasi dengan ahli gizi';
      case 'NORMAL':
        return '• Pertahankan pola makan sehat\n• Olahraga teratur 3-4 kali seminggu\n• Istirahat yang cukup';
      case 'GEMUK':
        return '• Kurangi makanan berlemak dan manis\n• Tingkatkan aktivitas fisik\n• Perbanyak konsumsi sayur dan buah';
      case 'OBESITAS':
        return '• Konsultasi dengan dokter\n• Program diet terstruktur\n• Olahraga rutin dengan pengawasan';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HASIL BMI'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // CARD HASIL UTAMA
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Text(
                      'HASIL PERHITUNGAN BMI',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // NILAI BMI
                    Text(
                      bmi.toString(),
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: warna,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // KATEGORI
                    Text(
                      kategori,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: warna,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // CARD REKOMENDASI
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'REKOMENDASI:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(_getPesanRekomendasi()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // TOMBOL KEMBALI
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                icon: const Icon(Icons.home),
                label: const Text('KEMBALI KE HALAMAN UTAMA'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
