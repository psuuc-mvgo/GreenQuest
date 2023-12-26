import 'package:flutter/material.dart';
import 'package:green_quest/screens/Login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  Future<void> _confirmLogout() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _logout();
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Widget _buildCard(String title, String description, String imageUrl, {bool reverse = false}) {
  return GestureDetector(
    onTap: () {
      // Add navigation logic here
    },
    child: Card(
      elevation: 4,
      child: Row(
        children: [
          if (!reverse)
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          SizedBox(width: 16),
          Container(
            width: 200,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          if (reverse)
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GreenQuest'),
        
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF9DC08B),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              margin: EdgeInsets.only(left: 16, top: 8),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                  'assets/images/GreenQuestLogo.png',
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search logic here
            },
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF9DC08B),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        'assets/images/GreenQuestLogo.png',
                      ),
                    ),
                    Text(
                      'Welcome to GreenQuest!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Account'),
              onTap: () {
                // Add your account logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                // Add your help logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                _confirmLogout();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Welcome to GreenQuest!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: 15),
             _buildCard(
  'Eco-Friendly Task',
  "Empower your journey to a greener lifestyle! Seamlessly engage in eco-friendly tasks, make a positive impact, and contribute to a sustainable future. Your actions matter—start your green quest today!",
  'https://img.pikbest.com/origin/08/99/65/79tpIkbEsTHiC.png!w700wp',
),
SizedBox(height: 20),
_buildCard(
  'Points System',
  "Earn valuable points for completing tasks and contribute to a sustainable lifestyle. The Points System rewards your eco-friendly efforts, making every action count.",
  'https://static.vecteezy.com/system/resources/previews/024/044/186/non_2x/money-coins-clipart-transparent-background-free-png.png',
  reverse: true,
),
SizedBox(height: 20),
_buildCard(
  'Tree Catalog',
  "Explore our Tree Catalog and 'purchase' trees using your earned points. Learn about each tree species and the environmental benefits they bring. Plant a tree, grow a greener future!",
  'https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/25440/tree-open-clipart-07022019-clipart-md.png',
),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  selectedItemColor: Colors.black,  // Set the desired color
  items: [
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _currentIndex == 0 ? Colors.black : null,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.home, color: _currentIndex == 0 ? Colors.white : null),
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _currentIndex == 1 ? Colors.black : null,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.assignment, color: _currentIndex == 1 ? Colors.white : null),
      ),
      label: 'Tasks',
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: _currentIndex == 2 ? Colors.black : null,
          shape: BoxShape.circle,
        ),
        child: FaIcon(
          FontAwesomeIcons.tree,  // Use the Font Awesome tree icon
          size: 24,  // Set the desired size
          color: _currentIndex == 2 ? Colors.white : null,
        ),
      ),
      label: 'Trees',
    ),
  ],
),
    );
  }
}
