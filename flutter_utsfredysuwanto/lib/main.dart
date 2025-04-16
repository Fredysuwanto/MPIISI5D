import 'package:flutter/material.dart';
import 'models/gempa.dart';
import 'services/gempa_service.dart';

void main() {
  runApp(const MahasiswaApp());
}

class MahasiswaApp extends StatelessWidget {
  const MahasiswaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Info Gempa - BMKG',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GempaScreen(),
    );
  }
}

class GempaScreen extends StatefulWidget {
  const GempaScreen({super.key});

  @override
  State<GempaScreen> createState() => _GempaScreenState();
}

class _GempaScreenState extends State<GempaScreen> {
  late Future<Gempa> futureGempa;

  @override
  void initState() {
    super.initState();
    futureGempa = GempaService.fetchGempa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info Gempa Terkini')),
      body: FutureBuilder<Gempa>(
        future: futureGempa,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Tidak ada data'));
          } else {
            final gempa = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tanggal: ${gempa.tanggal}"),
                  Text("Jam: ${gempa.jam} WIB"),
                  Text("Magnitude: ${gempa.magnitude}"),
                  Text("Kedalaman: ${gempa.kedalaman}"),
                  Text("Koordinat: ${gempa.lintang}, ${gempa.bujur}"),
                  Text("Wilayah: ${gempa.wilayah}"),
                  Text("Potensi: ${gempa.potensi}"),
                  Text("Dirasakan: ${gempa.dirasakan}"),
                  Image.network("https://data.bmkg.go.id/DataMKG/TEWS/20250416044537.mmi.jpg")
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
