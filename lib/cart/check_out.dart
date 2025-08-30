import 'package:flutter/material.dart';
import 'package:frehas_task/navigations/navigator.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -------- ADDRESS --------
            const Text(
              "Shipping Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.red),
                title: const Text("123 Main Street"),
                subtitle: const Text("City, Country - ZIP 00000"),
                trailing: TextButton(
                  onPressed: () {
                    // TODO: Navigate to edit address screen
                  },
                  child: const Text("Change"),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // -------- PAYMENT --------
            const Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.credit_card, color: Colors.red),
                title: const Text("Visa **** 1234"),
                subtitle: const Text("Exp: 12/25"),
                trailing: TextButton(
                  onPressed: () {
                    // TODO: Select other payment method
                  },
                  child: const Text("Change"),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // -------- DELIVERY --------
            const Text(
              "Delivery Option",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  RadioListTile(
                    value: "standard",
                    groupValue: "standard",
                    onChanged: (value) {},
                    title: const Text("Standard (3-5 days)"),
                    secondary: const Text("\$5"),
                  ),
                  RadioListTile(
                    value: "express",
                    groupValue: "standard",
                    onChanged: (value) {},
                    title: const Text("Express (1-2 days)"),
                    secondary: const Text("\$10"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // -------- ORDER SUMMARY --------
            const Text(
              "Order Summary",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Subtotal"), Text("\$120")],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Shipping"), Text("\$5")],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$125",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // -------- PLACE ORDER --------
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.orderConfirmation);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Order Placed Successfully!")),
                  );
                  // TODO: Move to Order Confirmation screen
                },
                child: const Text(
                  "Place Order",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
