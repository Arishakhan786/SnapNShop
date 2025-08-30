import 'package:flutter/material.dart';
import 'package:frehas_task/navigations/navigator.dart'; // use your AppRoutes

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: Colors.red,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Delivered"),
            Tab(text: "Processing"),
            Tab(text: "Canceled"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrderList("Delivered"),
          _buildOrderList("Processing"),
          _buildOrderList("Canceled"),
        ],
      ),
    );
  }

  Widget _buildOrderList(String status) {
    // Fake order list (later you can fetch from backend)
    final orders = [
      {
        'id': 'INV54783458',
        'date': '05-12-2023',
        'qty': 3,
        'total': 125,
        'status': status,
      },
      {
        'id': 'INV54783459',
        'date': '10-12-2023',
        'qty': 2,
        'total': 80,
        'status': status,
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            title: Text(
              "Order #${order['id']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Qty: ${order['qty']}  |  Date: ${order['date']}"),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$${order['total']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _statusChip(order['status'] as String),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.orderDetails, // e.g. '/order-details'
                          arguments: order,
                        );
                      },
                      child: const Text("Details"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statusChip(String status) {
    Color color;
    switch (status) {
      case "Delivered":
        color = Colors.green;
        break;
      case "Processing":
        color = Colors.orange;
        break;
      case "Canceled":
        color = Colors.red;
        break;
      default:
        color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
    );
  }
}
