import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String location;
  final String followers;
  final String price;
  final String status;
  final String imagePath;
  final String ageTag;

  const ProductCard({
    super.key,
    required this.name,
    required this.location,
    required this.followers,
    required this.price,
    required this.status,
    required this.imagePath,
    required this.ageTag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(imagePath),
                  radius: 30,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: ageTag == "New" ? Colors.green : Colors.green,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(ageTag, style: const TextStyle(color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      Text(location, style: const TextStyle(color: Colors.grey)),
                      Text("$followers Followers", style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: const Text("Edit")),
                    TextButton(onPressed: () {}, child: const Text("Delete", style: TextStyle(color: Colors.red))),
                  ],
                ),
                Text("Verified", style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
