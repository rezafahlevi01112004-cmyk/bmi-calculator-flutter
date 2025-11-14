import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Panduan Medis BMI'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1565C0),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Icon(Icons.medical_information,
                      color: Colors.white, size: 40),
                  SizedBox(height: 15),
                  Text(
                    'Body Mass Index (BMI)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // INFO CARDS
            _buildInfoCard(
              'Apa itu BMI?',
              'Body Mass Index (BMI) adalah pengukuran standar untuk menilai apakah berat badan seseorang proporsional dengan tinggi badannya.',
            ),
            const SizedBox(height: 15),
            _buildInfoCard(
              'Rumus Perhitungan',
              'BMI = Berat Badan (kg) / (Tinggi Badan (m) × Tinggi Badan (m))',
            ),
            const SizedBox(height: 25),

            // CATEGORIES
            const Text(
              'Kategori BMI:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1565C0),
              ),
            ),
            const SizedBox(height: 15),

            _buildCategoryItem('UNDERWEIGHT', '< 18.5', Colors.orange),
            const SizedBox(height: 10),
            _buildCategoryItem('NORMAL', '18.5 - 24.9', Colors.green),
            const SizedBox(height: 10),
            _buildCategoryItem('OVERWEIGHT', '25 - 29.9', Colors.orange),
            const SizedBox(height: 10),
            _buildCategoryItem('OBESITY', '≥ 30', Colors.red),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String content) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 8),
          Text(content),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String kategori, String range, Color warna) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: warna,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kategori,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: warna,
                  ),
                ),
                Text(
                  range,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
