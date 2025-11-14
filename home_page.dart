import 'package:flutter/material.dart';
import 'calculator_page.dart';
import 'info_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF1565C0),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.medical_services,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Text(
                          'Klinik Digital\nBMI Check',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Pemeriksaan Indeks Massa Tubuh Digital',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ICON
                    Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.health_and_safety,
                        size: 80,
                        color: Color(0xFF1565C0),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // TITLE
                    const Text(
                      'Body Mass Index Checker',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1565C0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Alat pemeriksaan digital untuk mengukur indeks massa tubuh',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),

                    // BUTTONS - PERBAIKAN DI SINI
                    SizedBox(
                      width: double.infinity,
                      child: _buildButton(
                        'MULAI PEMERIKSAAN',
                        Icons.fact_check,
                        const Color(0xFF1565C0),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CalculatorPage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: _buildButton(
                        'INFORMASI MEDIS', // TEKS LEBIH PENDEK
                        Icons.medical_information,
                        const Color(0xFF388E3C),
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const InfoPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, IconData icon, Color color, Function onTap) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: () => onTap(),
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(16), // REDUCED PADDING
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10), // REDUCED PADDING
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 22), // SMALLER ICON
                ),
                const SizedBox(width: 12), // REDUCED SPACING
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15, // SMALLER FONT
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                    maxLines: 1, // PREVENT TEXT WRAPPING
                    overflow: TextOverflow.ellipsis, // ADD ELLIPSIS IF TOO LONG
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: color,
                  size: 14, // SMALLER ARROW
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
