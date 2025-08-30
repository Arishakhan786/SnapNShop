import 'package:flutter/material.dart';
import 'package:frehas_task/navigations/navigator.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Dummy cart data
  List<Map<String, dynamic>> cartItems = [
    {
      "name": "Men’s T-Shirt",
      "price": 20.0,
      "quantity": 1,
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOp2GGkyuF2hb1n_GNNZ8rMZX7Fz72DsQL1w&s",
    },
    {
      "name": "Women’s Dress",
      "price": 45.0,
      "quantity": 2,
      "image":
          "data:image/jpeg;base64,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",
    },
  ];

  double get subtotal => cartItems.fold(
    0,
    (sum, item) => sum + (item["price"] * item["quantity"]),
  );

  double get discount => subtotal * 0.10; // 10% off
  double get total => subtotal - discount;

  void updateQuantity(int index, int change) {
    setState(() {
      cartItems[index]["quantity"] += change;
      if (cartItems[index]["quantity"] <= 0) {
        cartItems[index]["quantity"] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Bag"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: Image.network(
                      item["image"],
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(item["name"]),
                    subtitle: Text("\$${item["price"]}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => updateQuantity(index, -1),
                        ),
                        Text("${item["quantity"]}"),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => updateQuantity(index, 1),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // 🔹 Summary Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Subtotal"),
                    Text("\$${subtotal.toStringAsFixed(2)}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Discount"),
                    Text("-\$${discount.toStringAsFixed(2)}"),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\$${total.toStringAsFixed(2)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    // 👉 Go to Checkout Screen
                    Navigator.pushNamed(context, AppRoutes.checkout);
                  },
                  child: const Text("CHECKOUT"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
