import 'package:flutter/material.dart';
import 'detail_service_page.dart'; // import file baru

class HomePage extends StatefulWidget {
  final String email;
  const HomePage({super.key, required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  final List<String> items = [
    "DayCare -- Penitipan Paws",
    "Boarding Paws -- Paws Hotel",
    "Gromeow -- Grooming",
    "Vaksinasi & Kesehatan",
    "Paw Visit -- Kunjungan",
    "Paw Transport -- Antar Jemput Paw",
    "TeleConsult -- Konsultasi Online",
  ];

  void _handleSearch() {
    String query = searchController.text.trim().toLowerCase();

    final match = items.firstWhere(
      (item) => item.toLowerCase().contains(query),
      orElse: () => "",
    );

    if (match.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailServicePage(serviceName: match),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Service tidak ditemukan"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7F6), // ungu lembut
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF48FB1), Color(0xFF7E57C2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔹 Sapaan + Avatar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hallo, ${widget.email}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 16, color: Colors.white70),
                                SizedBox(width: 4),
                                Text(
                                  "Indonesia",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, color: Colors.purple),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 🔹 Search bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: "Search.....",
                                border: InputBorder.none,
                              ),
                              onSubmitted: (_) => _handleSearch(),
                            ),
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.search, color: Colors.purple),
                            onPressed: _handleSearch,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Banner Selamat Datang
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Selamat Datang di Cozypaws 🐾",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Tempat terbaik untuk perawatan dan kenyamanan hewan kesayangan Anda.",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Mengapa memilih kami
              _buildWhyChooseSection(),

              const SizedBox(height: 20),

              // 🔹 Layanan Kami
              _buildCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Layanan Kami",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 12),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.pets, color: Colors.purple),
                            title: Text(items[index]),
                            trailing: const Icon(Icons.arrow_forward_ios,
                                size: 16, color: Colors.grey),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailServicePage(
                                      serviceName: items[index]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Testimoni
              _buildTestimoniSection(),

              const SizedBox(height: 20),

              // 🔹 Emergency
              _buildEmergencySection(),

              const SizedBox(height: 20),

              // 🔹 Lokasi
              _buildLokasiSection(),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // === Widget Tambahan ===
  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildWhyChooseSection() {
    final items = [
      {"icon": Icons.verified, "text": "Fasilitas aman dan bersertifikat"},
      {"icon": Icons.favorite, "text": "Perawatan penuh kasih sayang"},
      {"icon": Icons.access_time, "text": "Layanan 24 jam tersedia"},
      {"icon": Icons.emoji_events, "text": "Tim profesional berpengalaman"},
    ];

    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Mengapa Memilih Cozypaws?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Icon(item["icon"] as IconData, color: Colors.purple),
                  const SizedBox(width: 8),
                  Text(item["text"] as String),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildTestimoniSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Testimoni Pemilik Pet",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Text("⭐⭐⭐⭐⭐"),
          Text(
              '"Pelayanan yang luar biasa! Kucing saya, Luna, selalu senang saat dititipkan di Cozypaws."\n- Sarah, Pemilik Kucing Luna'),
          SizedBox(height: 10),
          Text("⭐⭐⭐⭐⭐"),
          Text(
              '"Grooming terbaik di kota! Max selalu tampak ganteng setelah dari sini."\n- Andi, Pemilik Anjing Max'),
        ],
      ),
    );
  }

  Widget _buildEmergencySection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.phone_in_talk, color: Colors.red),
              SizedBox(width: 8),
              Text(
                "Emergency 24/7",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text("Ada situasi darurat dengan pet Anda?"),
          SizedBox(height: 8),
          Text(
            "+62 812-3456-7890",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildLokasiSection() {
    return _buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.purple),
              SizedBox(width: 8),
              Text(
                "Lokasi Kami",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text("Jl. Pet Paradise No. 123"),
          Text("Jakarta Selatan, DKI Jakarta"),
        ],
      ),
    );
  }
}
