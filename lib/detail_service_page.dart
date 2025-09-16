import 'package:flutter/material.dart';

class DetailServicePage extends StatefulWidget {
  final String serviceName;

  const DetailServicePage({super.key, required this.serviceName});

  @override
  State<DetailServicePage> createState() => _DetailServicePageState();
}

class _DetailServicePageState extends State<DetailServicePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController ownerController = TextEditingController();
  final TextEditingController pawController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  int? selectedPrice;

  @override
  Widget build(BuildContext context) {
    final Map<String, Widget> serviceDetails = {
      "DayCare -- Penitipan Paws": _buildDaycareService(),
      "Boarding Paws -- Paws Hotel": _buildBoardingService(),
      "Gromeow -- Grooming": _buildGroomingService(),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail service",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF48FB1), Color(0xFF7E57C2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: serviceDetails[widget.serviceName] ??
          const Center(child: Text("Detail service belum tersedia.")),
    );
  }

  Widget _buildDaycareService() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFF48FB1).withOpacity(0.9),
                  const Color(0xFF7E57C2).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Day Care",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Jangan khawatir meninggalkan meow sendirian! "
                          "Day Care hadir sebagai rumah kedua, tempat meow bermain, "
                          "bersosialisasi, dan mendapatkan kasih sayang.",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.3,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // PAKET HARGA
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 75000),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 75000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 75.000"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Area bermain luas & bersih"),
                        Text("• Playtime & sosialisasi"),
                        Text("• Pemberian makan & minum"),
                        Text("• Pengawasan berpengalaman"),
                        Text("• Update foto/video ke pemilik"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 150000),
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 150000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 150.000"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Ruang privat ber-AC"),
                        Text("• Mainan interaktif & scratching post"),
                        Text("• Makanan khusus sesuai request"),
                        Text("• Playtime personal & grooming"),
                        Text("• Update real-time (foto/video/live)"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSyaratSection(),
          const SizedBox(height: 20),
          _buildBookingForm("Booking Day Care"),
        ],
      ),
    );
  }

  Widget _buildBoardingService() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFF48FB1).withOpacity(0.9),
                  const Color(0xFF7E57C2).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Boarding Paws",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Boarding Paws hadir sebagai hotel khusus untuk meow kesayanganmu! "
                          "Dengan kamar standar hingga VIP yang nyaman, pengawasan penuh 24 jam, "
                          "serta layanan perawatan dasar, kami memastikan meow tetap aman, sehat, dan bahagia selama menginap.",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.3,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // PAKET HARGA
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 100000),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 100000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 100.000 / malam"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Kamar dengan fasilitas standar"),
                        Text("• Playtime harian"),
                        Text("• Pemberian makan sesuai jadwal"),
                        Text("• Perawatan dasar (kebersihan, grooming)"),
                        Text("• Update harian"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 200000),
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 200000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 200.000 / malam"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Kamar VIP ber-AC"),
                        Text("• Mainan interaktif & scratching post"),
                        Text("• Pemberian makanan khusus sesuai request"),
                        Text("• CCTV & update real-time"),
                        Text("• Luxury Grooming"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildSyaratSection(),
          const SizedBox(height: 20),
          _buildBookingForm("Booking Boarding"),
        ],
      ),
    );
  }

  Widget _buildGroomingService() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFF48FB1).withOpacity(0.9),
                  const Color(0xFF7E57C2).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GrowMeow",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Rawat bulu dan kebersihan meow kesayangan dengan layanan grooming lengkap dari Cozypaws.",
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.3,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // PAKET HARGA
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 80000),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 80000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 80.000 / sekali grooming"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Mandi & shampoo khusus kucing"),
                        Text("• Blow dry / pengeringan bulu"),
                        Text("• Potong kuku dasar"),
                        Text("• Pembersihan telinga"),
                        Text("• Perapihan bulu dasar"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 120000),
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 120000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 120.000 / sekali grooming"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Semua fasilitas Basic"),
                        Text("• Perapihan bulu ringan (trimming)"),
                        Text("• Pembersihan area mata & hidung"),
                        Text("• Parfum khusus kucing hypoallergenic"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 180000),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 180000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 180.000 / sekali grooming"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Semua fasilitas Standard"),
                        Text("• Grooming full body detail"),
                        Text("• Perawatan kutu & anti-fleas"),
                        Text("• Vitamin bulu untuk kesehatan"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => selectedPrice = 250000),
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: selectedPrice == 250000
                            ? Colors.purple
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText("Rp 250.000 / sekali grooming"),
                        SizedBox(height: 10),
                        Text(
                          "Fasilitas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text("• Semua fasilitas Premium"),
                        Text("• Styling bulu sesuai request"),
                        Text("• Spa relaksasi aromaterapi kucing"),
                        Text("• Foto dokumentasi setelah grooming"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildBookingForm("Booking Grooming"),
        ],
      ),
    );
  }

  Widget _buildSyaratSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Syarat",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text("• Kucing dalam kondisi sehat (tidak sakit menular)"),
          Text("• Sudah vaksin dasar lengkap & rutin vaksin tahunan"),
          Text("• Bebas kutu, jamur kulit, dan cacingan"),
          Text("• Usia minimal 3 bulan"),
          Text("• Membawa makanan & kebutuhan khusus bila ada"),
          Text("• Membawa buku kesehatan/kartu vaksin"),
        ],
      ),
    );
  }

  Widget _buildBookingForm(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 14),
            buildTextField("Nama Pemilik", ownerController),
            const SizedBox(height: 12),
            buildTextField("Nama Paw , Jenis", pawController),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: buildTextField("Tanggal", dateController),
                ),
                const SizedBox(width: 10),
                Expanded(child: buildTextField("Jam", timeController)),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF48FB1), Color(0xFF7E57C2)],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate() && selectedPrice != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Pesanan berhasil! Datang sesuai jadwal yang telah ditentukan!",
                        ),
                        backgroundColor: Colors.purple,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Pilih paket & isi semua form terlebih dahulu.",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text(
                  "Pesan Sekarang",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  

  Widget buildTextField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      validator: (val) => val == null || val.isEmpty ? "Wajib diisi" : null,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}

// TEXT GRADIENT KOMPONEN
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  
  const GradientText(
    this.text, {
    super.key,
    this.style = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color(0xFFF48FB1), Color(0xFF7E57C2)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}