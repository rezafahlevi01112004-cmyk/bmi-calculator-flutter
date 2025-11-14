import 'package:flutter/material.dart';
import 'result_page.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _tinggiController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  String _pesanError = '';

  // FUNGSI VALIDASI INPUT
  bool _validateInput() {
    double? tinggi = double.tryParse(_tinggiController.text);
    double? berat = double.tryParse(_beratController.text);

    if (tinggi == null || berat == null) {
      setState(() {
        _pesanError = 'Masukkan angka yang valid';
      });
      return false;
    }

    if (tinggi <= 0 || berat <= 0) {
      setState(() {
        _pesanError = 'Tinggi dan berat harus lebih dari 0';
      });
      return false;
    }

    setState(() {
      _pesanError = '';
    });
    return true;
  }

  // FUNGSI HITUNG BMI
  Map<String, dynamic> _hitungBMI() {
    double tinggi = double.parse(_tinggiController.text);
    double berat = double.parse(_beratController.text);

    double tinggiMeter = tinggi / 100;
    double bmi = berat / (tinggiMeter * tinggiMeter);
    bmi = double.parse(bmi.toStringAsFixed(1));

    // TENTUKAN KATEGORI
    String kategori;
    Color warna;

    if (bmi < 18.5) {
      kategori = 'KURUS';
      warna = Colors.orange;
    } else if (bmi < 25) {
      kategori = 'NORMAL';
      warna = Colors.green;
    } else if (bmi < 30) {
      kategori = 'GEMUK';
      warna = Colors.orange;
    } else {
      kategori = 'OBESITAS';
      warna = Colors.red;
    }

    return {
      'bmi': bmi,
      'kategori': kategori,
      'warna': warna,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HITUNG BMI'),
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
            // INPUT TINGGI
            _buildInputField(
              label: 'TINGGI BADAN (cm)',
              icon: Icons.height,
              controller: _tinggiController,
            ),
            const SizedBox(height: 20),

            // INPUT BERAT
            _buildInputField(
              label: 'BERAT BADAN (kg)',
              icon: Icons.monitor_weight,
              controller: _beratController,
            ),
            const SizedBox(height: 30),

            // PESAN ERROR
            if (_pesanError.isNotEmpty) _buildError(),
            const SizedBox(height: 20),

            // TOMBOL HITUNG
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_validateInput()) {
                    Map<String, dynamic> hasil = _hitungBMI();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmi: hasil['bmi'],
                          kategori: hasil['kategori'],
                          warna: hasil['warna'],
                        ),
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.calculate),
                label: const Text('HITUNG SEKARANG'),
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

  // WIDGET INPUT FIELD
  Widget _buildInputField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            border: const OutlineInputBorder(),
            hintText: 'Masukkan $label',
          ),
        ),
      ],
    );
  }

  // WIDGET ERROR
  Widget _buildError() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red[50],
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.red),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _pesanError,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tinggiController.dispose();
    _beratController.dispose();
    super.dispose();
  }
}
