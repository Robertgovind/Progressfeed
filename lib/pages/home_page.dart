import 'package:flutter/material.dart';
import 'package:progressfeed/pages/add_post_page.dart';
import 'package:progressfeed/pages/feed_page.dart';
import 'package:progressfeed/pages/map_page.dart';
import 'package:progressfeed/pages/notification_page.dart';
import 'package:progressfeed/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedItem = "Feed";
  int? currPageIndex = 0;

  List<Widget> pages = [
    const FeedPage(),
    const MapPage(),
    const AddPostPage(),
    const NotificationPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.blue,
        leadingWidth: 150,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          child: _dropDown(),
        ),
      ),
      bottomNavigationBar: _buttomNavigation(),
      body: SafeArea(
        child: pages[currPageIndex!],
      ),
    );
  }

  Widget _dropDown() {
    List<String> coins = ["Feed", "Nearby", "Maps"];
    List<DropdownMenuItem<String>> items = coins
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
        .toList();
    return DropdownButton(
      value: selectedItem,
      items: items,
      iconEnabledColor: Colors.white,
      onChanged: (value) {
        selectedItem = value;
        setState(() {});
      },
      dropdownColor: const Color.fromRGBO(83, 88, 206, 1.0),
      iconSize: 40,
      iconDisabledColor: Colors.white,
      icon: const Icon(Icons.arrow_drop_down_outlined),
    );
  }

  Widget _buttomNavigation() {
    return BottomNavigationBar(
      fixedColor: Colors.blue,
      backgroundColor: Colors.blue,
      onTap: (value) {
        setState(() {
          currPageIndex = value;
          print(currPageIndex);
        });
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.feed,
            ),
            label: "Feed"),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.map_outlined,
          ),
          label: "Map",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
          ),
          label: "Add",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notification_important,
          ),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
