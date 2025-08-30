import 'package:flutter/material.dart';
import 'package:frehas_task/Home/home_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String? selectedSize;
  Color? selectedColor;

  final List<String> availableSizes = ["S", "M", "L", "XL"];
  final List<Color> availableColors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(widget.product.name),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Product Image with AspectRatio (prevents cutting)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 1, // Makes it a square box
                child: Container(
                  color: Colors.white,
                  child: Image.network(
                    widget.product.image,
                    fit: BoxFit.contain, // No more cutting
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Name & Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "\$${widget.product.price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 🔹 Description
            Text("Description", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 5),
            Text(
              widget.product.description,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 20),

            // 🔹 Size Options
            Text("Select Size", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: availableSizes.map((size) {
                final isSelected = selectedSize == size;
                return ChoiceChip(
                  label: Text(size),
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                  selected: isSelected,
                  selectedColor: Colors.black,
                  onSelected: (selected) {
                    setState(() {
                      selectedSize = selected ? size : null;
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // 🔹 Color Options
            Text(
              "Select Color",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 12,
              children: availableColors.map((color) {
                final isSelected = selectedColor == color;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColor = color;
                    });
                  },
                  child: CircleAvatar(
                    radius: isSelected ? 20 : 18,
                    backgroundColor: color,
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),

            // 🔹 Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Add to Cart Logic
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.white),
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Order Now Logic
                    },
                    icon: const Icon(Icons.flash_on, color: Colors.white),
                    label: const Text(
                      "Order Now",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
