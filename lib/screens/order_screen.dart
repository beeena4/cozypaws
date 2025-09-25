import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  final String packageName;
  final double price;

  const OrderScreen({
    super.key,
    required this.packageName,
    required this.price,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ownerController = TextEditingController();
  final _catNameController = TextEditingController();
  final _phoneController = TextEditingController();
  DateTime? _selectedDate;

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.purple, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pesanan Anda",
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Paket otomatis
              Text("Pawket pilihan : ${widget.packageName}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple)),
              const SizedBox(height: 4),
              Text("Harga : Rp ${widget.price}",
                  style: const TextStyle(fontSize: 12, color: Colors.green)),
              const SizedBox(height: 20),

              // Nama Pemilik
              TextFormField(
                controller: _ownerController,
                decoration: _inputDecoration("Nama Pemilik"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Nama pemilik wajib diisi" : null,
              ),
              const SizedBox(height: 12),

              // Nama Kucing
              TextFormField(
                controller: _catNameController,
                decoration: _inputDecoration("Nama Meow"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Nama meow wajib diisi" : null,
              ),
              const SizedBox(height: 12),

              // Tanggal Booking
              InkWell(
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _selectedDate = pickedDate;
                    });
                  }
                },
                child: InputDecorator(
                  decoration: _inputDecoration("Tanggal Booking"),
                  child: Text(
                    _selectedDate == null
                        ? "Pilih tanggal"
                        : "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}",
                  ),
                ),
              ),
              if (_selectedDate == null)
                const Padding(
                  padding: EdgeInsets.only(top: 6, left: 4),
                  child: Text(
                    "Tanggal booking wajib diisi",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 12),

              // Nomor Telepon
              TextFormField(
                controller: _phoneController,
                decoration: _inputDecoration("Nomor Telepon"),
                keyboardType: TextInputType.phone,
                validator: (val) =>
                    val == null || val.isEmpty ? "Nomor telepon wajib diisi" : null,
              ),
              const SizedBox(height: 20),

              // Metode Pembayaran dalam kotak
              InputDecorator(
                decoration: _inputDecoration("Metode Pembayaran"),
                child: const Text(
                  "Meowney On Spot (Cozy Paws)",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Gradient
              Center(
                child: Container(
                  width: 220,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF48FB1), Color(0xFF7E57C2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _selectedDate != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.purple,
                            content: Text(
                                "Pesanan ${widget.packageName} berhasil!\nPemilik: ${_ownerController.text},Kucing: ${_catNameController.text}, Tanggal: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.purple,
                              content:
                                  Text("Lengkapi semua data sebelum konfirmasi")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(85),
                      ),
                    ),
                    child: const Text(
                      "Konfirmasi Pesanan",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
