import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isBalanceHidden = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome James"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text("Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Transaction History with Inter Font
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Transaction History',
                   style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Available Balance Section with Hide/Unhide Feature
            Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(199, 232, 202, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Available Balance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Upgrade To Level2",
                            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          _isBalanceHidden ? "******" : "N780,000",
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isBalanceHidden = !_isBalanceHidden;
                            });
                          },
                          child: Icon(
                            _isBalanceHidden ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Pending Earnings + Withdraw Button in Same Row
                    Row(
                      children: [
                        const Text(
                          "Pending Earnings",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(), // Pushes the button to the right
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to Withdraw Page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(6, 125, 25, 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          child: const Text("Withdraw Fund", style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Advertisement Banner
            Container(
              height: 100,
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text("Advertisement Banner", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            const SizedBox(height: 20),
            // Product Listings
            const Text("Product Listings", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildProductCard("Facebook", "Carolina USA", "1k Followers", "N10"),
            _buildProductCard("Instagram", "Freetown Capeverde", "102 Followers", "N40"),
            _buildProductCard("Snapchat", "Abuja Nigeria", "3k Followers", "N50"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: "Withdraw"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.rule), label: "Rules"),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String location, String followers, String price) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text(name[0])),
        title: Text(name),
        subtitle: Text("$location\n$followers"),
        trailing: Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }
}
