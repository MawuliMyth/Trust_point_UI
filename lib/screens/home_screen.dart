import 'package:flutter/material.dart';
import 'package:testingscreens/constants.dart';

import '../customs/product_card.dart';

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
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.help_outline_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Image(image: AssetImage('images/logo.png')),
            ),
            ListTile(
              title: Text("Product Listing", style: joeStyles),
            ),
            ListTile(
              title: Text("Order Management", style: joeStyles),
            ),
            ListTile(
              title: Text("Withdrawal", style: joeStyles),
            ),
            ListTile(
              title: Text("Referral", style: joeStyles),
            ),
            ListTile(
              title: Text("Order Status", style: joeStyles),
            ),
            ListTile(
              title: Text("Notifications", style: joeStyles),
            ),
            ListTile(
              title: Text("Rules", style: joeStyles),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/jojo.jpg'),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text(
                  'Welcome Mawule',
                  style: TextStyle(
                    fontFamily: 'Qwerty',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Transaction History',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                      fontFamily: 'Qwerty'),
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
                        const Text("Available Balance",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Qwerty')),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Upgrade To Level2",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                fontFamily: 'Qwerty'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          _isBalanceHidden ? "******" : "N780,000",
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isBalanceHidden = !_isBalanceHidden;
                            });
                          },
                          child: Icon(
                            _isBalanceHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              fontFamily: 'Qwerty'),
                        ),
                        const Spacer(), // Pushes the button to the right
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to Withdraw Page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(6, 125, 25, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          child: const Text("Withdraw Fund",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Qwerty',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View All Status',
                  style: TextStyle(
                      fontFamily: 'qwerty',
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 10),
                Icon(Icons.tune)
              ],
            ),
            const SizedBox(height: 10),

            // Advertisement Banner
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(105, 150, 53, 1),
                    Color.fromRGBO(51, 99, 62, 1)
                  ], // Two colors
                  begin: Alignment.topLeft, // Gradient starts from top-left
                  end: Alignment.bottomRight, // Ends at bottom-right
                ),
                borderRadius:
                    BorderRadius.circular(16), // Optional rounded corners
              ),
              child: Text(
                'Advertisement Banner',
                style: TextStyle(
                    fontFamily: 'Qwerty',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Product Listings',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'qwerty'),),
                IconButton(onPressed: (){}, icon: Icon(Icons.tune),)
              ],
            ),
            // Product Listings
            ProductCard(
                name: "Facebook",
                location: "Carolina USA",
                followers: "1k",
                price: "N10",
                status: "Verified",
                imagePath: "images/facebook.png",
                ageTag: "New"),
            ProductCard(
                name: "Instagram",
                location: "Freetown Capeverde",
                followers: "102",
                price: "N40",
                status: "Verified",
                imagePath: "images/insta.jpeg",
                ageTag: "Old"),
            ProductCard(
                name: "Snapchat",
                location: "Abuja Nigeria",
                followers: "3k",
                price: "N50",
                status: "Verified",
                imagePath: "images/snap.jpeg",
                ageTag: "New"),

    Container(
    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
    BoxShadow(
    color: Colors.grey
    ),
    ],
    ),
    child: Row(
    children: [
    CircleAvatar(
    backgroundImage: AssetImage('images/money.png'),
    radius: 25,
    ),
    const SizedBox(width: 10),
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
    Text("Invite And Earn", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    Text("Invite Users And Earn Commission With The Link", style: TextStyle(color: Colors.grey, fontSize: 12)),
    ],
    ),
    ],
    ),
    ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(6, 125, 25, 1), // Green background
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_down),
              label: "Withdraw",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.warning_amber_outlined),
              label: "Rules",
            ),
          ],
        ),
      ),

    );
  }
}
