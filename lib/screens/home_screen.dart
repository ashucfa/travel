import 'package:flutter/material.dart';
import 'package:travel/screens/places_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //Bottom Navigation Bar
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> get _widgetOptions => <Widget>[
    HomeTabScreen(scaffoldKey: scaffoldKey),
    const HistoryTabScreen(),
    const FavoriteTabScreen(),
    const UserTabScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width; // Get screen width
    int itemCount = 4; // Number of BottomNavigationBar items
    double itemWidth = screenWidth / itemCount; // Calculate the width of each item


    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Filter Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.filter_alt),
              title: const Text('Filter 1'),
              onTap: () {
                // Add filter functionality here
              },
            ),
            ListTile(
              leading: const Icon(Icons.filter_list),
              title: const Text('Filter 2'),
              onTap: () {
                // Add filter functionality here
              },
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.watch_later_outlined),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border_outlined),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'User',
              ),
            ],
            currentIndex: _selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: const Color(0xff2F2F2F),
            unselectedItemColor: const Color(0xff848282),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 0, // Removes the shadow
          ),
          Positioned(
            bottom: 5, // Adjust the distance from the bottom
            left: (_selectedIndex * itemWidth) + (itemWidth / 2) - 4, // Center the dot under the selected item
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}

//Home Tab Screen
class HomeTabScreen extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomeTabScreen({Key? key, required this.scaffoldKey}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => HomeTabScreenState();
}
class HomeTabScreenState extends State<HomeTabScreen>{

  TextEditingController searchController = TextEditingController();

  int _selectedFilterIndex = 0; // Default to 0 index

  void _onFilterSelected(int index) {
    setState(() {
      _selectedFilterIndex = index;
    });
    // Implement your filter logic here
    print('Selected filter index: $index');

  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, David 👋',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xff2F2F2F),
                      fontFamily: 'MontserratSemiBold',
                    ),
                  ),
                  Text(
                    'Explore the world',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff888888),
                      fontFamily: 'MontserratSemiBold',
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: 30,
                child: Image.asset('assets/images/author.png'),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, right: 20, bottom: 10, left: 20),
          padding: const EdgeInsets.only(top: 5, right: 15, bottom: 5, left: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              width: 2,
              color: const Color(0xffD2D2D2),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchController,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xff888888),
                    fontFamily: 'RobotoMedium',
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Search places',
                    hintStyle: TextStyle(
                      color: Color(0xff888888),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    print('Search query: $value');
                  },
                ),
              ),
              const SizedBox(
                height: 24.0,
                width: 30.0,
                child: VerticalDivider(
                  width: 2.0,
                  thickness: 2.0,
                  color: Color(0xffD2D2D2),
                ),
              ),
              InkWell(
                onTap: () {
                  //scaffoldKey.currentState!.openEndDrawer();
                  widget.scaffoldKey.currentState?.openEndDrawer();
                },
                child: Image.asset(
                  'assets/images/filter.png',
                  width: 24,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, right: 20.0, bottom: 10.0, left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Popular places', style: TextStyle(
                fontFamily: 'RobotoMedium',
                fontSize: 20,
                color: Color(0xff2F2F2F),
              ),),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlacesScreen(),));
              }, child: const Text('View All', style: TextStyle(color: Color(0xff888888)),))
            ],
          ),
        ),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final bool isSelected = _selectedFilterIndex == index;
              return Padding(
                padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isSelected ? Colors.black : Colors.transparent,
                    foregroundColor: isSelected ? Colors.white : const Color(0xffC5C5C5), // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: isSelected ? 3 : 0, // Ensure no elevation or shadow
                    shadowColor: isSelected ? Color(0xff2F2F2F) : Colors.transparent,
                  ),
                  onPressed: () => _onFilterSelected(index),
                  child: Text('Most Viewed ${index + 1}'),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(left: 20.0),
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/placeImage.png'), // Path to your image
                  fit: BoxFit.cover, // Adjust this based on how you want the image to fit
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Aligns children at the bottom
                crossAxisAlignment: CrossAxisAlignment.end, // Aligns children to the end horizontally
                children: [
                  // Add your wishlist or favorite button here
                  Padding(
                    padding: const EdgeInsets.all(8.0), // Adds padding around the button
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement your button functionality here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Added to favorites!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff1D1D1D).withOpacity(0.5), // Background color
                        foregroundColor: Colors.white, // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
                      ),
                      child: Icon(Icons.favorite_border_outlined, size: 30,),
                    ),
                  ),
                ],
              ),
            );
          },
            itemCount: 5,
          ),
        )
      ],
    );

  }
}

//History Tab Screen
class HistoryTabScreen extends StatelessWidget {
  const HistoryTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff0172B2),
            Color(0xff014981),
            Color(0xff001645)
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('History\nComing Soon', style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 44,
                  color: Colors.white
              ),),
              const SizedBox(width: 10,),
              Image.asset('assets/images/globe-icon.png', width: 36,),
            ],
          ),
        ],
      ),
    );
  }
}

//Favorite Tab Screen
class FavoriteTabScreen extends StatelessWidget {
  const FavoriteTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff0172B2),
            Color(0xff014981),
            Color(0xff001645)
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Favorite\nComing Soon', style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 44,
                  color: Colors.white
              ),),
              const SizedBox(width: 10,),
              Image.asset('assets/images/globe-icon.png', width: 36,),
            ],
          ),
        ],
      ),
    );
  }
}

//User Tab Screen
class UserTabScreen extends StatelessWidget {
  const UserTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff0172B2),
            Color(0xff014981),
            Color(0xff001645)
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('User\nComing Soon', style: TextStyle(
                  fontFamily: 'Lobster',
                  fontSize: 44,
                  color: Colors.white
              ),),
              const SizedBox(width: 10,),
              Image.asset('assets/images/globe-icon.png', width: 36,),
            ],
          ),
        ],
      ),
    );
  }
}
