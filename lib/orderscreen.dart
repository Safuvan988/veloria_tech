import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> activeOrders = [
    {
      "status": "Pending",
      "title": "DJI Drone",
      "orderId": "#123456",
      "image": "assets/images/dji drone.jpeg",
    },
    {
      "status": "Ongoing",
      "title": "Canon Camera",
      "orderId": "#789012",
      "image": "assets/images/canon camara.jpeg",
    },
  ];

  final List<Map<String, String>> pastOrders = [
    {
      "status": "Completed",
      "title": "Canon Lens",
      "orderId": "#345678",
      "image": "assets/images/canon camara.jpeg",
    },
    {
      "status": "Cancelled",
      "title": "Bose Headphone",
      "orderId": "#901234",
      "image": "assets/images/bose 🎧.jpeg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildOrderCard(Map<String, String> order) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(order["image"]!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          order["title"]!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(order["status"]!, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 4),
            Text("Order ID: ${order["orderId"]}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.black,
          tabs: const [Tab(text: "Active"), Tab(text: "Past")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Active Orders
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: activeOrders.length,
            itemBuilder: (context, index) {
              return _buildOrderCard(activeOrders[index]);
            },
          ),
          // Past Orders
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: pastOrders.length,
            itemBuilder: (context, index) {
              return _buildOrderCard(pastOrders[index]);
            },
          ),
        ],
      ),
    );
  }
}
