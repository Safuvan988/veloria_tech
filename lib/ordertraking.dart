import 'package:flutter/material.dart';

class OrderTrackingPage extends StatelessWidget {
  final String orderId;
  final String orderName;
  final String orderImage;
  final double totalPrice;

  const OrderTrackingPage({
    super.key,
    required this.orderId,
    required this.orderName,
    required this.orderImage,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    // Sample tracking steps
    final List<Map<String, dynamic>> steps = [
      {
        "title": "Order Placed",
        "subtitle": "Order placed on 07/20/2024",
        "isCompleted": true,
      },
      {
        "title": "Order Accepted",
        "subtitle": "Order accepted on 07/21/2024",
        "isCompleted": true,
      },
      {
        "title": "Order Packed",
        "subtitle": "Order packed on 07/22/2024",
        "isCompleted": false,
      },
      {
        "title": "Order Completed",
        "subtitle": "Order completed on 07/23/2024",
        "isCompleted": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Tracking",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Info
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(orderImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Name: $orderName",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Order ID: $orderId",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Price
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.attach_money, color: Colors.black),
                ),
                const SizedBox(width: 10),
                Text(
                  "Total Price: \$$totalPrice",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              "Tracking Status",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            // Tracking Steps
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  final step = steps[index];
                  final bool isLast = index == steps.length - 1;

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Step indicator with line
                      Column(
                        children: [
                          Icon(
                            step["isCompleted"]
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color:
                                step["isCompleted"]
                                    ? Colors.green
                                    : Colors.grey,
                          ),
                          if (!isLast)
                            Container(
                              height: 40,
                              width: 2,
                              color: Colors.grey.shade300,
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),

                      // Step details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              step["title"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              step["subtitle"],
                              style: const TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
