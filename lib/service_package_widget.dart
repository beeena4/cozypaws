import 'package:flutter/material.dart';

class ServicePackage extends StatelessWidget {
  final int price;
  final String title;
  final List<String> fasilitas;
  final int selectedPrice;
  final Function(int) onSelected;

  const ServicePackage({
    super.key,
    required this.price,
    required this.title,
    required this.fasilitas,
    required this.selectedPrice,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onSelected(price),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
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
              color: selectedPrice == price ? Colors.purple : Colors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Rp $price", style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              const SizedBox(height: 6),
              ...fasilitas.map((f) => Text("• $f")).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
