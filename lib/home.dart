import 'package:flutter/material.dart';
import 'package:veloria_tech/orderscreen.dart';
import 'package:veloria_tech/productdetail.dart';
import 'package:veloria_tech/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final TextEditingController searchController = TextEditingController();

  final List<String> categories = [
    "All",
    "Electronics",
    "Home Appliances",
    "Sports",
    "Fashion",
    "Books",
  ];

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/kitchen set.jpeg",
      "title": "Smart Kitchen Set",
      "subtitle": "Upgrade your cooking experience",
    },
    {
      "image": "assets/images/Tech Bundle.jpeg",
      "title": "Tech Bundle",
      "subtitle": "Latest gadgets for enthusiasts",
    },
    {
      "image": "assets/images/Home Decor.jpeg",
      "title": "Home Decor",
      "subtitle": "Style your space beautifully",
    },
  ];

  final List<Map<String, String>> rentalitems = [
    {
      "image": "assets/images/dji drone.jpeg",
      "title": "DJI Drone",
      "subtitle": "Capture stunning aerial footage",
    },
    {
      "image": "assets/images/canon camara.jpeg",
      "title": "Canon Camera",
      "subtitle": "Professional photography equipment",
    },
    {
      "image": "assets/images/bose 🎧.jpeg",
      "title": "Bose Headphones",
      "subtitle": "Immersive sound experience",
    },
    {
      "image": "assets/images/gopro.jpeg",
      "title": "GoPro Hero",
      "subtitle": "Adventure-ready action camera",
    },
  ];

  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  void _onCategoryTap(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      _buildHomeScreen(),
      const OrdersScreen(),
      const Profile(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.08,
        titleSpacing: screenWidth * 0.05,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.07,
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    hintText: "Search",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                    suffixIcon:
                        searchController.text.isNotEmpty
                            ? IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                searchController.clear();
                                setState(() {});
                              },
                            )
                            : null,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              SizedBox(
                height: screenHeight * 0.04,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedCategoryIndex == index;
                    return GestureDetector(
                      onTap: () => _onCategoryTap(index),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.015,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected ? Colors.black : Colors.grey,
                            width: 1.2,
                          ),
                          color: isSelected ? Colors.black12 : Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.black : Colors.black87,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              const Text(
                'Featured Items',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              SizedBox(
                height: screenHeight * 0.3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => ProductDetailScreen(
                                  title: item["title"]!,
                                  subtitle: item["subtitle"]!,
                                  image: item["image"]!,
                                ),
                          ),
                        );
                      },
                      child: Container(
                        width: screenWidth * 0.45,
                        margin: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.asset(
                                item["image"]!,
                                height: screenHeight * 0.18,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["title"]!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.005),
                                  Text(
                                    item["subtitle"]!,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              const Text(
                "Popular Rentals",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: screenHeight * 0.015,
                  crossAxisSpacing: screenWidth * 0.03,
                  childAspectRatio: screenWidth / (screenHeight * .65),
                ),
                itemCount: rentalitems.length,
                itemBuilder: (context, index) {
                  final item = rentalitems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => ProductDetailScreen(
                                title: item["title"]!,
                                subtitle: item["subtitle"]!,
                                image: item["image"]!,
                              ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.asset(
                              item["image"]!,
                              height: screenHeight * 0.18,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["title"]!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.005),
                                Text(
                                  item["subtitle"]!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
