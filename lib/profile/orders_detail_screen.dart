import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Order #12345",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text("Placed on: 20 Aug 2025"),
            const SizedBox(height: 16),

            // Order Item 1
            ListTile(
              leading: Image.network(
                "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=200",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: const Text("Denim Jacket"),
              subtitle: const Text("Qty: 1"),
              trailing: const Text("\$50"),
            ),

            // Order Item 2
            ListTile(
              leading: Image.network(
                "https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?w=200",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: const Text("Casual Sneakers"),
              subtitle: const Text("Qty: 2"),
              trailing: const Text("\$120"),
            ),

            // Order Item 3
            ListTile(
              leading: Image.network(
                "https://images.unsplash.com/photo-1528701800489-20be9c1a3c48?w=200",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
              title: const Text("White T-shirt"),
              subtitle: const Text("Qty: 3"),
              trailing: const Text("\$45"),
            ),

            const Divider(height: 30),

            // Payment Summary
            const Text(
              "Payment Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Subtotal"), Text("\$215")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Shipping"), Text("\$10")],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "\$225",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
